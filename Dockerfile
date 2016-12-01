FROM ruby:2.3.0

RUN apt-get update -qq && apt-get install -y build-essential

ENV APP_HOME /app  
RUN mkdir $APP_HOME  
WORKDIR $APP_HOME

COPY . $APP_HOME
RUN bundle install

ADD . $APP_HOME 
