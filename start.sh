#!/usr/bin/env bash
cd "$(dirname "$0")"
sudo rm -f /tmp/dockerd.log
docker info >/dev/null 2>&1 || sudo /usr/local/share/docker-init.sh true
(cd crafty && docker compose up -d)
bash playit/start.sh
echo "CRAFTY: aba Ports, porta 8443."
echo "Login: crafty/data/config/default-creds.txt"
