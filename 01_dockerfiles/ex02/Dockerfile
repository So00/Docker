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
# docker build -t ft-rail:on-build .
# docker tag ft-rail:on-build ft-rail:on-build
