FROM oven/bun:1-debian

WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    curl \
    ca-certificates \
    ripgrep \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://github.com/Kilo-Org/kilocode.git .

RUN bun install

RUN bun run --cwd packages/opencode build

ENV HOST=0.0.0.0
ENV PORT=4000

EXPOSE 4000

CMD ["bun", "run", "--cwd", "packages/opencode", "src/index.ts", "serve", "--hostname", "0.0.0.0", "--port", "4000"]
