FROM ghcr.io/github/github-mcp-server:latest

RUN apk add --no-cache nodejs npm && npm install -g supergateway

ENV PORT=8080
EXPOSE 8080

ENTRYPOINT ["supergateway"]
CMD ["--stdio", "/server/github-mcp-server stdio", "--port", "8080", "--host", "0.0.0.0"]
