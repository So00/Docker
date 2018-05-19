FROM ubuntu:16.04

# 80 = HTTP, 443 = HTTPS, 3000 = MEAN.JS server, 35729 = livereload, 8080 = node-inspector
EXPOSE 80 443 3000 35729 8080

#Install sudo
RUN apt-get update -q \
 && apt-get install -y sudo curl npm

#add nodejs version 8 and mongodb to install
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

# Install Utilitis
RUN apt-get update -q  \
 && DEBIAN_FRONTEND=noninteractive apt-get install -yqq \
 git \
 ssh \
 clang \
 make \
 apt-utils \
 gem \
 mongodb \
 build-essential \
 nodejs \
 && apt-get clean

#start mongo database
RUN service mongodb start

#Clone the official mean git
RUN git clone https://github.com/linnovate/mean.git

WORKDIR mean

#update npm
RUN npm i npm@latest -g && npm install

#ENTRYPOINT ["npm", "start"]