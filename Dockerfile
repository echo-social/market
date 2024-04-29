# build static
FROM node:16.18.1-alpine 

RUN apk add build-base
RUN apk add bash
RUN apk add git

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

RUN git clone https://github.com/echo-social/ocean.js.git -b feature/taraxa_testnet && cd ocean.js && npm install && npm run build

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
RUN npm install /ocean.js/

COPY address.json /app/node_modules/@oceanprotocol/contracts/addresses/address.json 

COPY .env.placeholder /app/.env

COPY entrypoint.sh /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]

CMD ["npm", "start"]
