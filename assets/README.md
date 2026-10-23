# 排版素材

book.css 是本專案原創樣式，含響應式閱讀與列印規則。圖解以原創純文字流程圖呈現。

HTML 與 PDF 使用從 Google Fonts 官方倉庫固定版本取得的 Noto Sans TC TrueType 字型，核對固定 SHA-256 後，以 fontTools 建立實際文字子集，重新命名為 Handbook CJK。HTML 內嵌字型與完整 SIL OFL 1.1 授權文字，可離線閱讀；PDF 嵌入字型子集。這解決既有 CFF 字型把部分中文字元映射成康熙部首的文字擷取問題。英文程式碼使用 DejaVu Sans Mono。

原始字型來源與雜湊見 data/font-sources.json，完整授權保存在 fonts/OFL.txt。子集仍採相同字型授權，不冒用保留字型名稱。產生的 TTF 可重建，不加入 Git。

DOCX 指定 Noto Sans CJK TC，但使用者裝置仍需有合適字型；本次完成 OOXML 重新開啟與樣式檢查，未做 Microsoft Word 桌面視覺實測。

沒有匯入他人教材圖片。
