"""Actual loopback HTTP contract checks; no credentials or external endpoints."""
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
import json, subprocess, tempfile, threading
from datetime import datetime, timezone
ROOT = Path(__file__).resolve().parents[1]
class Handler(BaseHTTPRequestHandler):
    def log_message(self, *args):
        pass
    def do_GET(self):
        body = json.dumps({'id':'A1','count':0,'name':'繁中'} if self.path == '/item' else {'error':'not found'},ensure_ascii=False).encode()
        self.send_response(200 if self.path == '/item' else 404)
        self.send_header('Content-Type','application/json; charset=utf-8')
        self.send_header('Content-Length',str(len(body)))
        self.end_headers()
        self.wfile.write(body)
    def do_POST(self):
        data = json.loads(self.rfile.read(int(self.headers['Content-Length'])))
        body = json.dumps(data,ensure_ascii=False).encode()
        self.send_response(200)
        self.send_header('Content-Type','application/json; charset=utf-8')
        self.send_header('Content-Length',str(len(body)))
        self.end_headers()
        self.wfile.write(body)
server = ThreadingHTTPServer(('127.0.0.1',0),Handler)
thread = threading.Thread(target=server.serve_forever,daemon=True)
thread.start()
code = r'''
param([string]$BaseUri)
$ErrorActionPreference='Stop'
$checks = [Collections.Generic.List[string]]::new()
$result = Invoke-RestMethod -Uri ($BaseUri+'/item') -StatusCodeVariable status -ConnectionTimeoutSeconds 5 -OperationTimeoutSeconds 5
if ($status -ne 200) { throw 'status' }; $checks.Add('GET status 200')
if ($result.id -ne 'A1' -or $result.count -ne 0) { throw 'shape' }; $checks.Add('GET required id and zero count')
if ($result.name -cne '繁中') { throw 'encoding' }; $checks.Add('GET UTF-8')
$rejected=$false
try { Invoke-RestMethod -Uri ($BaseUri+'/missing') -ConnectionTimeoutSeconds 5 -OperationTimeoutSeconds 5 | Out-Null }
catch { if ([int]$_.Exception.Response.StatusCode -eq 404) {$rejected=$true} else {throw} }
if (-not $rejected) { throw '404 not rejected' }; $checks.Add('404 is failure, not empty success')
$json = @{name='繁中';enabled=$true} | ConvertTo-Json -Compress
$echo = Invoke-RestMethod -Uri ($BaseUri+'/echo') -Method Post -ContentType 'application/json; charset=utf-8' -Body ([Text.Encoding]::UTF8.GetBytes($json)) -ConnectionTimeoutSeconds 5 -OperationTimeoutSeconds 5
if ($echo.name -cne '繁中' -or $echo.enabled -isnot [bool] -or -not $echo.enabled) { throw 'POST data' }
$checks.Add('POST UTF-8 JSON and boolean roundtrip')
$checks | ConvertTo-Json
'''
try:
    with tempfile.TemporaryDirectory(prefix='rest-fixture-') as tmp:
        path=Path(tmp)/'contract.ps1';path.write_text(code)
        result=subprocess.run(['bash','scripts/pwsh.sh','-NoProfile','-File',str(path),'-BaseUri',f'http://127.0.0.1:{server.server_port}'],cwd=ROOT,capture_output=True,text=True,timeout=30)
    report=dict(run_at_utc=datetime.now(timezone.utc).isoformat(),scope='ephemeral loopback HTTP only; no TLS/OAuth/enterprise validation',exit_code=result.returncode,stdout=result.stdout,stderr=result.stderr)
    (ROOT/'progress/rest-http-results.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
    print(result.stdout,result.stderr)
    assert result.returncode==0,report
finally:
    server.shutdown();server.server_close();thread.join(timeout=5)
