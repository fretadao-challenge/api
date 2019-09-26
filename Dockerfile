FROM ruby:2.6.3

RUN apt-get update -qq && \
  apt-get install -y nodejs \
  build-essential \
  libpq-dev

WORKDIR /api
