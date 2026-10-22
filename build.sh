#!/bin/sh
# Wraps portfolio.html (artifact source) into a standalone index.html for any static host.
cd "$(dirname "$0")"
{
  printf '<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n<link rel="icon" href="assets/photo.webp">\n'
  printf '<style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}img{max-width:100%%}[hidden]{display:none!important}</style>\n'
  sed -n '1,/^<\/style>/p' portfolio.html
  printf '</head>\n<body>\n'
  sed '1,/^<\/style>/d' portfolio.html | sed "s#const RESUME_URL = '';#const RESUME_URL = 'assets/Atharva_U_Kalase_CV.pdf';#"
  printf '</body>\n</html>\n'
} > index.html
echo "built index.html"
