#!/usr/bin/env bash
# Export a carousel to a PDF made of one PNG per slide (macOS, Google Chrome).
#
# Chrome's vector PDF draws a hairline frame around gradient text (background-clip: text)
# next to the radial background blobs. Rasterizing each slide avoids it, and LinkedIn
# shows carousel pages as images anyway.
#
# Usage: linkedin/carousels/export-pdf.sh linkedin/carousels/<carousel>.html [output.pdf]
set -euo pipefail

CHROME="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"
SIZE=1080

src="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
out="${2:-${src%.html}.pdf}"
dir="$(dirname "$src")"
name="$(basename "$src" .html)"
slides=$(grep -c 'class="slide slide-' "$src")

work="$(mktemp -d)"
trap 'rm -rf "$work" "$dir/.export-$name.html"' EXIT

# One screenshot per slide: a copy next to the source (relative image paths still resolve)
# that only shows slide N, laid out like the print version
pages=""
for i in $(seq 1 "$slides"); do
  css=".controls,.instructions,.slide-label,.bottom-spacer{display:none!important}"
  css="$css html,body{margin:0;padding:0;background:none}.slide-wrapper{margin:0}"
  css="$css .slide-wrapper:not(:nth-child($i of .slide-wrapper)){display:none}"
  sed "s#</head>#<style>$css</style></head>#" "$src" > "$dir/.export-$name.html"
  "$CHROME" --headless=new --hide-scrollbars --force-device-scale-factor=1 \
    --window-size="$SIZE,$SIZE" --screenshot="$work/slide-$i.png" \
    "file://$dir/.export-$name.html" 2>/dev/null
  pages="$pages<img src=\"slide-$i.png\">"
done

cat > "$work/pages.html" <<EOF
<!DOCTYPE html><html><head><style>
@page { size: ${SIZE}px ${SIZE}px; margin: 0; }
html, body { margin: 0; padding: 0; }
img { display: block; width: ${SIZE}px; height: ${SIZE}px; break-after: page; }
img:last-child { break-after: avoid; }
</style></head><body>$pages</body></html>
EOF

"$CHROME" --headless=new --no-pdf-header-footer --print-to-pdf="$out" "file://$work/pages.html" 2>/dev/null
echo "$slides slides → $out"
