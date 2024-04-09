# build static
FROM node:16.18.1-alpine as builder


RUN apk add build-base
RUN apk add bash
RUN apk add git

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

WORKDIR /app

COPY . /app/

RUN npm install
RUN npm install --save-dev @next/eslint-plugin-next

COPY address.json /app/node_modules/@oceanprotocol/contracts/addresses/address.json 

RUN npm run build:static

# nginx
FROM nginx:1.25.1-alpine
COPY --from=builder /app/out /usr/share/nginx/html
