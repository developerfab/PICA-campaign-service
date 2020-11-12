FROM ruby:2.6.5

RUN apt-get update && apt-get install build-essential && apt-get install libc6-dev && apt-get install freetds-dev -y && apt-get install -yqq --no-install-recommends zip unzip libpq-dev libaio1 libaio-dev

WORKDIR /app
ENV APP_HOME=/app
ENV ORACLE_HOME=/opt/oracle
ENV LD_LIBRARY_PATH=/opt/oracle/instantclient_12_2
ADD . /app

RUN mkdir -p $ORACLE_HOME
WORKDIR $ORACLE_HOME
RUN unzip $APP_HOME/vendor/instantclient-basiclite-linux.x64-12.2.0.1.0.zip
RUN unzip $APP_HOME/vendor/instantclient-sdk-linux.x64-12.2.0.1.0.zip
RUN unzip $APP_HOME/vendor/instantclient-sqlplus-linux.x64-12.2.0.1.0.zip

WORKDIR $APP_HOME
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN ln -s $ORACLE_HOME/instantclient_12_2/libclntsh.so.12.1 $ORACLE_HOME/instantclient_12_2/libclntsh.so
RUN gem install bundler
RUN bundle install

CMD ./rails db:setup db:migrate

EXPOSE 3008

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3008"]
