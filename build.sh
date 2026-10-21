#!/usr/bin/env sh
# Regenerates docs/index.html (the GitHub Pages copy) from index.html (the artifact source),
# adding the doctype, <head> and <body> that claude.ai normally wraps around the artifact.
set -e
cd "$(dirname "$0")"
mkdir -p docs
{
  printf '<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
  printf '<style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}img{max-width:100%%}[hidden]{display:none!important}</style>\n'
  sed -n '1,/^<\/style>$/p' index.html
  printf '</head>\n<body>\n'
  sed -n '/^<\/style>$/,$p' index.html | tail -n +2
  printf '</body>\n</html>\n'
} > docs/index.html
touch docs/.nojekyll
echo "Built docs/index.html"
