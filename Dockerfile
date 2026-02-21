FROM node:20-slim AS sg
RUN npm install -g supergateway

FROM ghcr.io/github/github-mcp-server:latest

COPY --from=sg /usr/local/bin/node /usr/local/bin/node
COPY --from=sg /usr/local/lib/node_modules /usr/local/lib/node_modules

EXPOSE 8080

ENTRYPOINT []
CMD ["node", "/usr/local/lib/node_modules/supergateway/bin/supergateway.mjs", "--stdio", "/server/github-mcp-server stdio", "--port", "8080", "--host", "0.0.0.0"]
