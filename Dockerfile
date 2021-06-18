# syntax=docker/dockerfile:1
FROM node:16-alpine3.11
WORKDIR /app
COPY package.json package.json
COPY yarn.lock yarn.lock
RUN yarn --prod
EXPOSE 5000
COPY ./build .
CMD ["node", "index.js"]
