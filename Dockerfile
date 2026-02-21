FROM ghcr.io/github/github-mcp-server:latest

ENV PORT=8080
EXPOSE 8080

CMD ["http", "--port", "8080"]
