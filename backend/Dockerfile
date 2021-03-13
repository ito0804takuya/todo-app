FROM ruby:2.6.3

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
RUN apt-get update -qq && \
  apt-get install -y build-essential \
  libpq-dev \
  nodejs \
  sudo && \
  gem install bundler

RUN bundle install

# ファイル郡をコピー
COPY . ${APP_HOME}

# ホスト(ローカルマシン)のどのポートにつなぐか
EXPOSE ${PORT}

CMD ["rails", "server", "-b", ${HOST}]