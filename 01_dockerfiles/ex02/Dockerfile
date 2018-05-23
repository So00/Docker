FROM ruby

RUN	apt-get update -y &&\
	apt-get upgrade -y &&\
	apt-get install -y nodejs

RUN gem install rails

ONBUILD WORKDIR /opt/app

ONBUILD COPY . .

ONBUILD EXPOSE 3000

ONBUILD RUN bundle install
ONBUILD RUN rails db:migrate
ONBUILD RUN rails db:seed
# docker build -t ft-rails:on-build .
# docker tag ft-rails:on-build ft-rails:on-build
