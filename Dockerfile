FROM node:16.2.0-alpine as node

WORKDIR /app

COPY . .

RUN yarn install && yarn build

FROM nginx:1.19-alpine

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

COPY --from=node /app/build .

ENTRYPOINT ["nginx", "-g", "daemon off;"]

