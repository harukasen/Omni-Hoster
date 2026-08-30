FROM node:22-bookworm-slim

RUN npm install -g omniroute

ENV NODE_ENV=production
ENV OMNIROUTE_SERVER_HOST=0.0.0.0
ENV REQUIRE_API_KEY=true
ENV AUTH_COOKIE_SECURE=true

CMD ["sh", "-c", "exec omniroute serve --port ${PORT} --no-open --log"]
