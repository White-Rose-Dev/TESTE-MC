#!/usr/bin/env bash
cd "$(dirname "$0")"
bash playit/start.sh
(cd crafty && docker compose up -d) || echo "Docker/compose indisponível: ver devcontainer."
echo "Crafty: https://localhost:8443 (aba Ports do Codespace)"
