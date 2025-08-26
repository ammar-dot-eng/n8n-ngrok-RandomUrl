FROM n8nio/n8n:latest

USER root

# Install wget for healthcheck
RUN apk add --no-cache wget

# Copy custom entrypoint script
COPY n8n-entrypoint.sh /n8n-entrypoint.sh
RUN chmod +x /n8n-entrypoint.sh

USER node
ENTRYPOINT ["/n8n-entrypoint.sh"]
