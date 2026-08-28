#!/bin/zsh

set -euo pipefail

flyer_dir="${0:A:h}"
chrome_app="$(mdfind "kMDItemCFBundleIdentifier == 'com.google.Chrome'" | head -n 1)"

if [[ -z "$chrome_app" ]]; then
  print -u2 "Google Chrome is required to render the PNG flyer."
  exit 1
fi

cd "$flyer_dir"
quarto render index.qmd

# A 3x device scale yields a crisp 2448 × 3168 image from the Letter-size HTML.
"$chrome_app/Contents/MacOS/Google Chrome" \
  --headless=new \
  --disable-gpu \
  --hide-scrollbars \
  --force-device-scale-factor=3 \
  --window-size=816,1056 \
  --screenshot="$flyer_dir/CaihongQin-flyer.png" \
  "file://$flyer_dir/index.html" \
  2>/dev/null
