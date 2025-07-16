FROM alpine:latest

# Instala dependências
RUN apk update && apk add --no-cache redis bash nodejs npm

# Instala n8n globalmente na última versão
RUN npm install -g n8n@latest

# Copia script de start
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 6379 5678

CMD ["/start.sh"]
