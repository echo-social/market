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

# COPY . /app/

COPY .github /app/.github
COPY .husky /app/.husky
COPY .jest /app/.jest
COPY .storybook /app/.storybook
COPY content /app/content
COPY public /app/public
COPY scripts /app/scripts
COPY src /app/src

COPY .git /app/.git

COPY .eslintrc /app/.eslintrc
COPY .nvmrc /app/.nvmrc
COPY .prettierrc /app/.prettierrc
COPY app.config.js /app/app.config.js
COPY LICENSE /app/LICENSE
COPY netlify.toml /app/netlify.toml
COPY next-env.d.ts /app/next-env.d.ts
COPY next.config.js /app/next.config.js
COPY package-lock.json /app/package-lock.json
COPY package.json /app/package.json
COPY tsconfig.json /app/tsconfig.json

RUN npm install
RUN npm install --save-dev @next/eslint-plugin-next

COPY address.json /app/node_modules/@oceanprotocol/contracts/addresses/address.json 

COPY .env.placeholder /app/.env

RUN npm run build:static

# nginx
FROM nginx:1.25.1-alpine

COPY --from=builder /app/out /usr/share/nginx/html
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
