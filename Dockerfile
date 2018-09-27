FROM ruby:2.5

RUN gem install bundler
RUN gem install foreman
RUN gem install rails -v '2.5.1'

ENV RAILS_ENV production
ENV PORT 8080

RUN bundle install

CMD bundle exec rake db:migrate assets:precompile