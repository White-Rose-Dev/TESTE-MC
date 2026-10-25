#!/usr/bin/env bash
cd "$(dirname "$0")"
sudo rm -f /tmp/dockerd.log
docker info >/dev/null 2>&1 || sudo /usr/local/share/docker-init.sh true
bash playit/start.sh
(cd crafty && docker compose up -d)
echo "Crafty: aba Ports do Codespace, porta 8443 (HTTPS)."
echo "Credenciais: crafty/data/config/default-creds.txt"
