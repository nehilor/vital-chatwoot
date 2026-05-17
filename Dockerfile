FROM chatwoot/chatwoot:v4.13.0

WORKDIR /app

RUN ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
  && ln -s /usr/local/lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx \
  && npm install -g pnpm@10.27.0

RUN SECRET_KEY_BASE=dummy RAILS_ENV=production bundle exec rake assets:precompile

CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]
