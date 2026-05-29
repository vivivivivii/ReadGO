FROM node:20-bookworm-slim

# better-sqlite3 需要编译原生模块
RUN apt-get update \
  && apt-get install -y --no-install-recommends python3 make g++ \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .
RUN npm run build

ENV NODE_ENV=production
ENV PORT=3456

RUN mkdir -p data uploads

EXPOSE 3456

CMD ["npm", "start"]
