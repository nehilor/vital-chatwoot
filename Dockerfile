FROM chatwoot/chatwoot:v4.13.0

WORKDIR /app

RUN SECRET_KEY_BASE=dummy RAILS_ENV=production bundle exec rake assets:precompile

CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]
