#!/bin/bash
echo "🔮 Launching Cursed WebUI via Rye..."
export PYTHON=$(rye which python)
rye run python launch.py --api "$@"
