FROM oven/bun:1-debian

WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    curl \
    ca-certificates \
    ripgrep \
    xz-utils \
    && rm -rf /var/lib/apt/lists/*

# Install Zig
RUN curl -L https://ziglang.org/download/0.15.1/zig-x86_64-linux-0.15.1.tar.xz \
    -o /tmp/zig.tar.xz \
    && mkdir -p /opt/zig \
    && tar -xf /tmp/zig.tar.xz -C /opt/zig --strip-components=1 \
    && ln -s /opt/zig/zig /usr/local/bin/zig \
    && rm /tmp/zig.tar.xz

RUN git clone --depth 1 https://github.com/Kilo-Org/kilocode.git .

RUN bun install

RUN bun run --cwd packages/opencode build

ENV HOST=0.0.0.0
ENV PORT=4000

EXPOSE 4000

CMD ["bun", "run", "--cwd", "packages/opencode", "src/index.ts", "serve", "--hostname", "0.0.0.0", "--port", "4000"]
