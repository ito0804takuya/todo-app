FROM ruby:2.6.3-alpine

# パッケージ郡（都度追加する）
ENV RUNTIME_PACKAGES "mysql-client mysql-dev tzdata nodejs"
ENV DEV_PACKAGES "build-base curl-dev"

ENV APP_HOME /app
ENV TZ Asia/Tokyo

# プロジェクト直下の.envがあるから不要ではある
ENV HOST 0.0.0.0
ENV PORT 3000

# コンテナ内の実行ディレクトリを/appとし、まずはGemfileをコピー
WORKDIR ${APP_HOME}
ADD Gemfile ${APP_HOME}/Gemfile
ADD Gemfile.lock ${APP_HOME}/Gemfile.lock

# インストール
RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache ${RUNTIME_PACKAGES} \
    && apk add --update --no-cache --virtual=.build-dependencies ${DEV_PACKAGES} \
    && bundle install -j4 \
    && rm -rf /usr/local/bundle/cache/*.gem \
        && find /usr/local/bundle/gems/ -name "*.c" -delete \
        && find /usr/local/bundle/gems/ -name "*.o" -delete \
    && apk del --purge .build-dependencies \
    && rm -rf /var/cache/apk/*

# ファイル郡をコピー
COPY . ${APP_HOME}

# ホスト(ローカルマシン)のどのポートにつなぐか
EXPOSE ${PORT}

CMD ["rails", "server", "-b", ${HOST}]