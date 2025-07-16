FROM node:20-alpine

RUN apk update && apk add --no-cache git bash redis ffmpeg nginx

# Clona Evolution API
RUN git clone https://github.com/EvolutionAPI/evolution-api.git /evolution-api

WORKDIR /evolution-api
RUN npm install
RUN npm run build

# Instala n8n globalmente
RUN npm install -g n8n

# Copia configuração do nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Copia script de start
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 80

CMD ["/start.sh"]
