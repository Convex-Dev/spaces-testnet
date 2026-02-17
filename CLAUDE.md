# Claude Code Guidelines for Convex Testnet

## Project Overview

This is a **Convex Testnet** deployed as a [Hugging Face Space](https://huggingface.co/spaces/mikera1337/convex-testnet). It runs a single Convex peer with the REST API and MCP server exposed on port 7860 (HuggingFace's expected port).

The entire project is a Dockerfile — it clones, builds, and runs Convex from source.

## Architecture

Three-stage Docker build:

1. **Clone** — shallow clone of `convex` develop branch
2. **Build** — Maven build producing `convex.jar` uberjar (tests skipped for speed)
3. **Run** — minimal JRE image running `convex local start --api-port=7860`

## Endpoints (port 7860)

| Path | Purpose |
|------|---------|
| `/api/v1/...` | Convex REST API |
| `/mcp` | MCP server (JSON-RPC over HTTP) |
| `/.well-known/mcp` | MCP capability discovery |

## Remotes

- **origin** — HuggingFace (`https://huggingface.co/spaces/mikera1337/convex-testnet`)
- **github** — GitHub mirror (`https://github.com/Convex-Dev/spaces-testnet`)

Pushing to `origin` triggers a HuggingFace Space rebuild automatically.

## Building Locally

```bash
docker build -t convexlive/convex-testnet:latest .
docker run -p 7860:7860 convexlive/convex-testnet:latest
```

## Key Considerations

- The build clones from GitHub at build time — the Docker image always gets the latest `develop` branch
- No persistent storage — testnet state is ephemeral and resets on container restart
- HuggingFace Spaces have resource limits (`cpu-basic` tier) — this is for testing, not production load
