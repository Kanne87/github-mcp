FROM ghcr.io/github/github-mcp-server:latest AS github-mcp

FROM node:20-alpine
RUN npm install -g supergateway
COPY --from=github-mcp /github-mcp-server /usr/local/bin/github-mcp-server
ENV PORT=8080
EXPOSE 8080
CMD ["supergateway", "--stdio", "github-mcp-server", "--port", "8080", "--host", "0.0.0.0"]
