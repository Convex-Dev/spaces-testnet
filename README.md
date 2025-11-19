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

This repository runs a **Convex Testnet** as a a Hugging Face space for easy experimentation by AI
innovaters and agentic AI usage.

It includes a working Convex MCP Server

Check out the configuration reference at https://huggingface.co/docs/hub/spaces-config-reference

Convex documentation available at: [Convex Docs](https://docs.convex.world)

# Docker build

```
docker build -t convexlive/convex-testnet:latest .
```

Or if need to clear cache for the Covia build:

```
docker build --no-cache-filter build -t convexlive/convex-testnet:latest .
```
