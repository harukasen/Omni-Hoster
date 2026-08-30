FROM node:22-bookworm-slim

RUN npm install -g omniroute

ENV NODE_ENV=production
ENV OMNIROUTE_SERVER_HOST=0.0.0.0

CMD ["sh", "-c", "omniroute serve --port ${PORT} --no-open"]
