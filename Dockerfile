FROM ruby:3.0.2-alpine3.12

RUN apk add --update --no-cache \
  build-base \
  postgresql-dev \
  tzdata \
  nodejs \
  yarn

ENV RAILS_ROOT /app
WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock package.json yarn.lock ./
RUN bundle install
RUN yarn install

COPY . .

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
