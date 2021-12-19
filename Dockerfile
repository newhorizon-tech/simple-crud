FROM ruby:2.6.5

ARG DEBIAN_FRONTEND=noninteractive
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -\
  && apt-get update -qq && apt-get install -qq nodejs postgresql-client \
  && npm install -g yarn@1

# RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn


WORKDIR /ror-docker
COPY . /ror-docker

RUN gem install bundler
RUN bundle install
RUN npm install

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server","-b", "0.0.0.0" ]
