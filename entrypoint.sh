#!/bin/bash
set -e

if [ -e "$BB_SOURCE/config.json" ]; then
    ln -sf "$BB_SOURCE/config.json" "$BB_CONTENT/config.json"
fi

exec "$@"
