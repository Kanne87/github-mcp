FROM ghcr.io/github/github-mcp-server:latest AS github-mcp

FROM node:20-slim

RUN npm install -g supergateway

COPY --from=github-mcp /server/github-mcp-server /usr/local/bin/github-mcp-server
COPY --from=github-mcp /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

ENV PORT=8080
EXPOSE 8080

ENTRYPOINT ["supergateway"]
CMD ["--stdio", "/usr/local/bin/github-mcp-server stdio", "--port", "8080", "--host", "0.0.0.0"]
