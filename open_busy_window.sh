#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
open -na "Google Chrome" --args \
  --app="file://$DIR/busy_screen.html" \
  --window-size=760,600 \
  --window-position=200,150
