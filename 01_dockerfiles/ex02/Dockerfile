FROM ruby

RUN	apt-get update -y &&\
	apt-get upgrade -y

EXPOSE 3000

ONBUILD RUN gem install rails

ONBUILD COPY . /opt/app

WORKDIR /opt/app

ONBUILD RUN rails db:migrate
ONBUILD RUN rails db:seed
