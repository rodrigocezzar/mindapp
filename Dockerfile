FROM ruby:3.2.2

ARG NODE_MAJOR_VERSION=19
RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR_VERSION.x | bash -
RUN apt-get update -qq && \
    apt-get install -y build-essential libvips nodejs libpq-dev postgresql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man && \
    npm install -g yarn

WORKDIR /importer
ADD . /importer
RUN gem install bundler
RUN bundle install