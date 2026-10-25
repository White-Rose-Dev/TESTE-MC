#!/usr/bin/env bash
cd "$(dirname "$0")"
SOCK="$HOME/.playit/playitd.sock"
BASE=https://github.com/playit-cloud/playit-agent/releases/download/v1.0.10
mkdir -p "$HOME/.playit"
case "$(uname -m)" in x86_64) A=amd64;; aarch64) A=aarch64;; *) echo "Arquitetura não suportada"; exit 1;; esac
[ -x playit-agent ] || { curl -fL -o playit-agent "$BASE/playit-linux-$A" && chmod +x playit-agent; }
[ -x playit-cli ]   || { curl -fL -o playit-cli "$BASE/playit-cli-linux-$A" && chmod +x playit-cli; }
pgrep -f playit-agent >/dev/null || { nohup ./playit-agent --socket-path "$SOCK" >/tmp/playit.log 2>&1 & sleep 2; }
if [ ! -f "$HOME/.config/playit_gg/playit.toml" ]; then
  pgrep -f "playit-cli.*setup" >/dev/null || { nohup ./playit-cli --socket-path "$SOCK" setup >/tmp/playit-claim.log 2>&1 & }
  for i in $(seq 1 15); do
    LINK=$(grep -o 'https://playit.gg/claim/[a-z0-9]*' /tmp/playit-claim.log 2>/dev/null | head -1)
    [ -n "$LINK" ] && break
    sleep 1
  done
  echo ""
  echo "=========================================="
  echo " PLAYIT: abre este link para o configurar:"
  echo " $LINK"
  echo "=========================================="
else
  echo "PLAYIT: já configurado."
fi
