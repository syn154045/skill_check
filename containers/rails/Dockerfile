FROM ruby:3.0.6

RUN apt-get update -qq && apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y yarn

ENV APP_ROOT /app

WORKDIR $APP_ROOT

COPY Gemfile Gemfile.lock package.json yarn.lock $APP_ROOT/
RUN bundle install
RUN yarn install

COPY . $APP_ROOT
