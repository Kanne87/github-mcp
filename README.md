# GitHub MCP Server (SSE Transport)

Wraps the official GitHub MCP Server (stdio) with supergateway to expose it as SSE endpoint for claude.ai integration.

## How it works

- Multi-stage Docker build: copies the `github-mcp-server` Go binary from the official image
- supergateway bridges stdio → SSE on port 8080

## Environment Variables

| Variable | Required | Description |
|---|---|---|
| `GITHUB_PERSONAL_ACCESS_TOKEN` | Yes | GitHub PAT with repo access |

## Coolify Deployment

Deploy as Docker Compose service with domain `github-mcp.kailohmann.de`.

## Claude.ai Integration

Add as MCP connector:
```
https://github-mcp.kailohmann.de/sse
```
