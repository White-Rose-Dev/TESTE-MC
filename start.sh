#!/usr/bin/env bash
cd "$(dirname "$0")"
bash playit/start.sh
(cd crafty && docker compose up -d)
echo "Pronto. Crafty em https://localhost:8443 | corre 'playit' para o túnel."
