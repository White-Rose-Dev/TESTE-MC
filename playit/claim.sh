#!/usr/bin/env bash
cd "$(dirname "$0")"
./playit-cli --socket-path "$HOME/.playit/playitd.sock" setup
