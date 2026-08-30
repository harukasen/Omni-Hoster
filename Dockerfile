FROM node:22-bookworm-slim

RUN npm install -g omniroute

ENV HOST=0.0.0.0
ENV PORT=20128

EXPOSE 20128

CMD ["sh", "-c", "omniroute --host 0.0.0.0 --port ${PORT}"]
