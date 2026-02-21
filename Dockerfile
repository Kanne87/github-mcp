FROM ghcr.io/github/github-mcp-server:latest AS github-mcp

FROM python:3.12-slim

RUN pip install --no-cache-dir mcp-proxy

COPY --from=github-mcp /server/github-mcp-server /usr/local/bin/github-mcp-server
COPY --from=github-mcp /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

EXPOSE 8080

CMD ["mcp-proxy", "--port", "8080", "--host", "0.0.0.0", "--", "github-mcp-server", "stdio"]
