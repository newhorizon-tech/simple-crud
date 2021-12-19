FROM ruby:2.6.5

ENV BUNDLE_VERSION 2.2.15

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /ror-docker
COPY . /ror-docker

RUN gem install bundler
RUN bundle install
RUN yarn install

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server","-b", "0.0.0.0" ]
