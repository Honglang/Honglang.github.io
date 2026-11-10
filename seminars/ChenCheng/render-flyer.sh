#!/bin/zsh

set -euo pipefail

flyer_dir="${0:A:h}"
speaker_folder="${flyer_dir:t}"
chrome_app="${CHROME_APP:-$(mdfind "kMDItemCFBundleIdentifier == 'com.google.Chrome'" | head -n 1)}"

if [[ -z "$chrome_app" ]]; then
  print -u2 "Google Chrome is required to render the PNG flyer."
  exit 1
fi

cd "$flyer_dir"
quarto render index.qmd

# Render the Letter-size HTML at 3x scale for a 2448 × 3168 PNG.
"$chrome_app/Contents/MacOS/Google Chrome" \
  --headless=new \
  --disable-gpu \
  --hide-scrollbars \
  --force-device-scale-factor=3 \
  --window-size=816,1056 \
  --screenshot="$flyer_dir/${speaker_folder}-flyer.png" \
  "file://$flyer_dir/index.html" \
  2>/dev/null

print "Rendered $flyer_dir/index.html"
print "Rendered $flyer_dir/${speaker_folder}-flyer.png"
