#!/usr/bin/env bash
# Export the CV pages of a built site to PDF with headless Chrome.
#
# Serves the built site on a local port, so the pages load their stylesheet, the avatar
# and the Inter web font, then prints each one to A4.
#
# Usage: scripts/export-cv.sh [site_dir] [output_dir]
#   site_dir    built site, default _site
#   output_dir  where the PDFs go, default <site_dir>/assets/cv
set -euo pipefail

site="${1:-_site}"
out="${2:-$site/assets/cv}"
port="${CV_PORT:-4555}"

if [ -z "${CHROME:-}" ]; then
  for candidate in "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" google-chrome google-chrome-stable chromium; do
    if [ -x "$candidate" ] || command -v "$candidate" >/dev/null 2>&1; then
      CHROME="$candidate"
      break
    fi
  done
fi
if [ -z "${CHROME:-}" ]; then
  echo "Google Chrome not found, set CHROME" >&2
  exit 1
fi

if [ ! -f "$site/cv/print/index.html" ]; then
  echo "$site/cv/print/index.html not found, build the site first" >&2
  exit 1
fi

mkdir -p "$out"
python3 -m http.server "$port" --bind 127.0.0.1 --directory "$site" >/dev/null 2>&1 &
server=$!
trap 'kill "$server" 2>/dev/null || true' EXIT
sleep 1

# page path → PDF name
pages=(
  "cv/print/:maxime-lenne-cv.pdf"
  "cv/print/ats/:maxime-lenne-cv-ats.pdf"
  "en/cv/print/:maxime-lenne-resume.pdf"
  "en/cv/print/ats/:maxime-lenne-resume-ats.pdf"
)

for entry in "${pages[@]}"; do
  path="${entry%%:*}"
  pdf="$out/${entry##*:}"
  # The virtual time budget lets the web font load before printing
  "$CHROME" --headless=new --no-pdf-header-footer --virtual-time-budget=10000 \
    --print-to-pdf="$pdf" "http://127.0.0.1:$port/$path" 2>/dev/null
  if command -v pdfinfo >/dev/null 2>&1; then
    count=$(pdfinfo "$pdf" | awk '/^Pages:/ {print $2}')
    echo "$path → $pdf ($count pages)"
    [ "$count" -le 2 ] || echo "  warning: more than 2 pages, untick some Print boxes in Notion" >&2
  else
    echo "$path → $pdf"
  fi
done
