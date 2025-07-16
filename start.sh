#!/bin/bash

# Inicia Redis em background
redis-server --daemonize yes

echo "Redis started"

# Inicia Evolution API
cd /evolution-api
npm run build
npm run start:prod &
echo "Evolution API started"

# Espera um pouco para Evolution subir
sleep 10

# Inicia N8N
n8n start
