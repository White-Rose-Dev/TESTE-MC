#!/usr/bin/env bash
if ! command -v playit >/dev/null; then
  curl -fsSL https://packages.playit.gg/install.sh | bash
fi
sudo mkdir -p /run/playit
pgrep -x playitd >/dev/null || (sudo nohup playitd >/tmp/playitd.log 2>&1 &)
sleep 2
sudo chmod 666 /run/playit/playitd.sock
