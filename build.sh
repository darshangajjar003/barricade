#!/usr/bin/env sh
# Regenerates the GitHub Pages copies in docs/ from the artifact sources, adding the
# doctype, <head> and <body> that claude.ai normally wraps around an artifact.
#
#   index.html          -> docs/index.html                  (Barricade)
#   strike4/index.html  -> docs/strike4/index.html          (Strike4 with themes)
#   strike4/classic.html -> docs/strike4/classic/index.html (Strike4 original look)
set -e
cd "$(dirname "$0")"

wrap() {
  src="$1"; out="$2"
  mkdir -p "$(dirname "$out")"
  {
    printf '<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
    printf '<style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}img{max-width:100%%}[hidden]{display:none!important}</style>\n'
    sed -n '1,/^<\/style>$/p' "$src"
    printf '</head>\n<body>\n'
    sed -n '/^<\/style>$/,$p' "$src" | tail -n +2
    printf '</body>\n</html>\n'
  } > "$out"
  echo "Built $out"
}

wrap index.html docs/index.html
wrap strike4/index.html docs/strike4/index.html
wrap strike4/classic.html docs/strike4/classic/index.html
touch docs/.nojekyll
