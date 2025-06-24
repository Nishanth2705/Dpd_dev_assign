# Stage 1: Build environment with uv
FROM ghcr.io/astral-sh/uv:python3.13-alpine AS builder

WORKDIR /app
COPY . .

# Creating a venv using uv sync and installing dependencies 
RUN uv venv && uv sync

FROM ghcr.io/astral-sh/uv:python3.13-alpine

WORKDIR /app
COPY --from=builder /app /app

# Activate .venv path
ENV PATH="/app/.venv/bin:$PATH"

# Exposing the port 8002
EXPOSE 8002

# Running the application using built in flask
CMD ["python", "app.py"]
