# syntax=docker/dockerfile:1
FROM node:16-alpine3.11
WORKDIR /app
COPY package.json package.json
COPY yarn.lock yarn.lock
RUN yarn install
COPY . .
RUN yarn build
RUN rm -rf node_modules
RUN yarn --prod
EXPOSE 5000
CMD ["node", "build/index.js"]
