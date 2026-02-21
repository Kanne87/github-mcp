FROM ghcr.io/github/github-mcp-server:latest

EXPOSE 8080

ENTRYPOINT ["/github-mcp-server"]
CMD ["--transport", "sse", "--sse-port", "8080", "--sse-host", "0.0.0.0"]
