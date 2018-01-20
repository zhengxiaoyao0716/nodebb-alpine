#!/bin/bash
set -e

if [[ "$*" == npm*start* ]]; then
    if [ ! -e "$BB_CONTENT/config.json" ]; then
        if [ -e "$BB_SOURCE/config.json" ]; then
            cp "$BB_SOURCE/config.json" "$BB_CONTENT/config.json"
        fi
    fi

    if [ -e "$BB_CONTENT/config.json" ]; then
        ln -sf "$BB_CONTENT/config.json" "$BB_SOURCE/config.json"
    fi

    exec "$@"
fi

exec "$@"
