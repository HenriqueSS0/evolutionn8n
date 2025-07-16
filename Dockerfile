FROM node:20-alpine

# Instala dependências básicas
RUN apk update && apk add --no-cache git bash redis ffmpeg

# Clona o Evolution API
RUN git clone https://github.com/EvolutionAPI/evolution-api.git /evolution-api

# Instala dependências da Evolution API
WORKDIR /evolution-api
RUN npm install

# Instala n8n globalmente
RUN npm install -g n8n

# Copia seu workflow do n8n (opcional)
# COPY workflow.json /workflows/workflow.json

# Copia script de start
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Exponha as portas que vão ser usadas
EXPOSE 6379 5678 8080

CMD ["/start.sh"]
