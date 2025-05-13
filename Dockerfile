FROM ghcr.io/astral-sh/uv:python3.13-bookworm-slim

# Makes install into the system Python
ENV UV_SYSTEM_PYTHON=true
ENV UV_PROJECT_ENVIRONMENT=/usr/local/


WORKDIR /workspace
COPY uv.lock uv.lock
COPY pyproject.toml pyproject.toml
RUN uv sync --frozen

COPY ./ /workspace

