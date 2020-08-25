FROM jruby:9

WORKDIR /usr/src/app

COPY . .
RUN bundle install


CMD ["bundle", "exec", "rspec", "-fd", "--pattern", "spec/**/grok_ctp_spec.rb"]
