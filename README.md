---
title: Convex Testnet
emoji: 🌍
colorFrom: indigo
colorTo: blue
sdk: docker
pinned: false
license: other
suggested_hardware: cpu-basic
short_description: Convex testnet for agentic economic systems (convex.world)
---

This repository runs a **Convex Testnet** as a Hugging Face Space for easy experimentation by AI
innovators and agentic AI usage.

It includes a working **Convex MCP Server** at the `/mcp` endpoint, ready for use by AI agents
and MCP-compatible clients. Server capabilities are discoverable at `/.well-known/mcp`.

Convex documentation available at: [Convex Docs](https://docs.convex.world)

## Docker build

```
docker build -t convexlive/convex-testnet:latest .
```

To force a fresh clone and build:

```
docker build --no-cache -t convexlive/convex-testnet:latest .
```
