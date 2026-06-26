---
name: priv-skill-release-devops
description: Local DevOps and release-readiness work for Docker, docker-compose, environment variables, build scripts, CI checks, pre-commit hooks, deployment docs, smoke tests, rollback notes, and release notes. Use when the user asks to package, run, containerize, verify, or prepare a service for delivery without invoking the full gstack-ship workflow.
---

# Skill Release DevOps

Use this skill for practical delivery plumbing: make it build, run, verify, and be explainable.

## Context

Inspect Dockerfiles, compose files, package/build scripts, CI config, env examples, deployment docs, health checks, logs, and release artifacts.

## Workflow

1. Identify the delivery target: local dev, CI, container image, staging deploy, production release, or release docs.
2. Check configuration surfaces: env vars, secrets handling, ports, volumes, service dependencies, health checks, migrations, and startup order.
3. Make the smallest config/script/doc change needed.
4. Verify with build, lint/type/test, container syntax/build, compose config, smoke endpoint, or documented manual checks as applicable.
5. For release notes, summarize user-visible changes, operational notes, migrations, rollback, and known risks. Do not rewrite changelog history.

## Rules

- Never hardcode secrets.
- Do not publish, push, deploy, or tag releases unless explicitly requested.
- Stop before destructive environment or database operations.
- Prefer reproducible commands and documented smoke checks.

## Finish

Report commands run, config touched, how to run/verify locally, release or rollback notes, and remaining deployment risk.
