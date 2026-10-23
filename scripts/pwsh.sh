#!/usr/bin/env bash
set -euo pipefail
# Keep writable runtime state outside the checkout and preserve inherited proxy/CA settings.
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-/workspace/handbook-tools/cache}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-/workspace/handbook-tools/config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-/workspace/handbook-tools/data}"
mkdir -p "$XDG_CACHE_HOME" "$XDG_CONFIG_HOME" "$XDG_DATA_HOME"
exec /workspace/handbook-tools/powershell/7.6.8/pwsh "$@"
