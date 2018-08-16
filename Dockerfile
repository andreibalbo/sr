FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN mkdir /sr
WORKDIR /sr
COPY Gemfile /sr/Gemfile
COPY Gemfile.lock /sr/Gemfile.lock
RUN bundle install
COPY . /sr
