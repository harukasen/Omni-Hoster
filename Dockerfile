FROM node:22-bookworm-slim

# Install OmniRoute globally
RUN npm install -g omniroute

# Koyeb provides PORT automatically
ENV NODE_ENV=production

# Start OmniRoute
CMD ["sh", "-c", "omniroute serve --port ${PORT} --no-open"]
