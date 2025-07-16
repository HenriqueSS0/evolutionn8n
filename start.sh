#!/bin/sh

# Inicia Redis em background
redis-server --daemonize yes

# Inicia n8n
n8n
