FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /sr
WORKDIR /sr
COPY Gemfile /sr/Gemfile
COPY Gemfile.lock /sr/Gemfile.lock
RUN bundle install
COPY . /sr
