#!/bin/bash
set -e

PROMPT=$(rye run python scripts/gen_cursed_prompt.py)
FILENAME=$(echo "$PROMPT" | tr '[:upper:]' '[:lower:]' | tr -cd '[:alnum:] _-' | tr ' ' '_' | cut -c1-64)
OUTDIR="${HOME}/cursed_output"

mkdir -p "$OUTDIR"

echo "🧠 Prompt: $PROMPT"
echo "🖼️  Saving output to: $OUTDIR/${FILENAME}.png"

# This assumes you're using the API endpoint locally
curl -s -X POST "http://127.0.0.1:7860/sdapi/v1/txt2img" \
    -H 'Content-Type: application/json' \
    -d '{
        "prompt": "'"$PROMPT"'",
        "steps": 25,
        "cfg_scale": 7.5,
        "width": 512,
        "height": 512,
        "sampler_name": "Euler a"
    }' | jq -r '.images[0]' | base64 -d > "${OUTDIR}/${FILENAME}.png"

echo "✅ Image saved: ${FILENAME}.png"
