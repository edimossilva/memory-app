FROM ruby:alpine3.12

WORKDIR /app
RUN apk update \
  && apk upgrade \
  && apk add --update --no-cache \
  build-base curl curl-dev git postgresql-dev \
  yaml-dev zlib-dev nodejs yarn tzdata

RUN gem install bundler rake

COPY ./app/Gemfile /app/Gemfile
COPY ./app/Gemfile.lock /app/Gemfile.lock
RUN bundle install

# docker build -t edimossilva/memory_app_rails
# docker push edimossilva/memory_app_rails
