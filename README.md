# Minecraft Server (Crafty + Playit)

Servidor de Minecraft gerido pelo Crafty, com túnel público via Playit. Pensado para GitHub Codespaces.

## Arrancar

Cria um Codespace sobre o repositório (Code > Codespaces > Create codespace on main) ou clona-o:

    git clone https://github.com/White-Rose-Dev/TESTE-MC
    cd TESTE-MC
    bash start.sh

Na primeira vez demora cerca de 1 minuto a descarregar o Crafty.

## Playit (túnel público)

No fim do `start.sh` aparece um link `https://playit.gg/claim/...` (só na primeira vez, enquanto o Playit não estiver configurado).

1. Abre o link e entra na tua conta playit.gg.
2. Aprova o agente.
3. No painel do playit.gg, cria um túnel Minecraft Java (TCP) para a porta local 25565.
4. Usa o endereço público do túnel para entrar no servidor.

## Crafty (painel)

1. Aba Ports do Codespace, porta 8443. Se não aparecer: Forward a Port, 8443, botão direito, Change Port Protocol, HTTPS.
2. Abre no browser e aceita o aviso do certificado.
3. Login: `cat crafty/data/config/default-creds.txt` (utilizador `admin`). Muda a password logo a seguir.
4. Servers > Create New Server e usa a porta 25565.

## Portas

Só estão publicadas a 8443 (painel) e a 25565 (Minecraft). Se precisares de mais servidores, acrescenta portas ao `crafty/docker-compose.yml`.
