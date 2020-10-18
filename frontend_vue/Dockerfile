FROM node:current-alpine3.12

WORKDIR /app

RUN yarn global add @vue/cli

COPY ./package.json /app/package.json
COPY ./yarn.lock /app/yarn.lock

RUN yarn install

# docker build . -t edimossilva/memory_app_vue
# docker push edimossilva/memory_app_vue