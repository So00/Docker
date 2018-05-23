FROM ubuntu:16.04

RUN	apt-get update -q &&\
	apt-get install -yq --no-install-recommends \
	ca-certificates \
	openssh-server \
	curl \
	postfix

RUN curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash

RUN apt-get update && apt-get install -yq gitlab-ce

RUN apt update && apt install -y tzdata && \
  apt-get clean

EXPOSE 22 8080

RUN echo '/opt/gitlab/embedded/bin/runsvdir-start&\nexternal_url="localhost" && gitlab-ctl reconfigure\ntail -f /dev/random' > entrypoint.sh

CMD [ "sh", "/entrypoint.sh" ]

#docker build -t gitlab .
#docker run -it -d --privileged -p 80:80 -p 22:22 -p 8080:8080 gitlab
