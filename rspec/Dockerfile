FROM ruby:2.3.0

RUN apt-get update -qq && apt-get install -y build-essential

ENV APP_HOME /app  
RUN mkdir $APP_HOME  
WORKDIR $APP_HOME

COPY . $APP_HOME
RUN gem install bundler
RUN bundle install --path vendor/bundle 

ADD . $APP_HOME 

EXPOSE 4567

ENTRYPOINT ["bundle", "exec"]

CMD ["ruby", "app.rb"]
