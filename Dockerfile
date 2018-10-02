FROM ruby:2.5

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y nodejs postgresql-client vim --no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/

RUN gem install typhoeus
RUN bundle config --global frozen 1
RUN bundle install --without development test

COPY . /usr/src/app

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]