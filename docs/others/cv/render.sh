#!/usr/bin/env bash
# Usage: ./render.sh [theme]   (default: harvard)
set -euo pipefail
dir=$(dirname "$0")
uv tool update "rendercv[full]"
rendercv render "$dir/cv_Zijin.yaml" -nomd -nohtml -nopng --design.theme "${1:-harvard}"
rm "$dir/rendercv_output/Zijin_Zhang_CV.typ"
