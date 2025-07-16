#!/bin/bash

# Inicia Redis em background
redis-server --daemonize yes

echo "Redis iniciado"

# Inicia Evolution API em background
cd /evolution-api
npm run start:prod &

echo "Evolution API iniciado"

# Dá um tempinho para Evolution subir
sleep 10

# Inicia n8n em background
n8n start &

echo "n8n iniciado"

# Inicia nginx em foreground (container mantém ativo)
nginx -g 'daemon off;'
