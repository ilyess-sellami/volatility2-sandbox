#!/bin/bash
# Usage: ./vol2.sh <memorydump> <volatility_plugin> [additional options]

if [ $# -lt 2 ]; then
    echo "Usage: $0 <memorydump_full_path> <plugin> [additional options]"
    exit 1
fi

MEMDUMP=$1
PLUGIN=$2
shift 2

# Resolve full absolute path
ABS_PATH=$(realpath "$MEMDUMP")
DIR_PATH=$(dirname "$ABS_PATH")
FILE_NAME=$(basename "$ABS_PATH")

# Run Docker, mount the folder containing the memory dump
docker run --rm -v "$DIR_PATH":/data volatility2-sandbox -f /data/"$FILE_NAME" $PLUGIN "$@"