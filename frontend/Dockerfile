# FROM node:12.9.0-alpine
FROM node:14.3

ENV APP_HOME /app
ENV PATH ${APP_HOME}/node_modules/.bin:$PATH
ENV TZ Asia/Tokyo

ENV HOST 0.0.0.0
ENV PORT 8080

WORKDIR ${APP_HOME}
ADD . ${APP_HOME}

# RUN apk update \
#     && apk upgrade \
#     && yarn install \
#     && rm -rf /var/cache/apk/*

# RUN apk update \
#     && apk upgrade \
#     && yarn install \
#     && npm install npm@6.14.4 \
#     && npm install ejs@3.0.1 \
#     && npm install nuxt@2.0.0 \
#     && npm install nuxt-create-app@2.15.0
#     && rm -rf /var/cache/apk/*

RUN apt-get update -y && \
  apt-get upgrade -y && \
  npm install npm@6.14.4 && \
  npm install ejs@3.0.1 && \
  npm install nuxt@2.0.0 && \
  npm install -g create-nuxt-app@2.15.0 && \
  npm install defu@3.1.0

EXPOSE ${PORT}

CMD ["yarn", "dev"]