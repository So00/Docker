#docker build -t openvpn .
#docker run -it --privileged -p 1194:1194 -p 1194:1194/udp openvpn .

#To start, just launched openvpn server.conf

#To connect containers, create key with ./build-key and their name, give them the key
# and a valid youname.conf with the ip of the server, to create a server ./build-key-server and enjoy

FROM debian:stretch

RUN apt-get update && apt-get -y install \
apt-utils \
build-essential \
clang \
vim \
make \
sudo \
git \
curl \
wget \
openvpn \
&& apt-get clean

RUN mkdir /etc/openvpn/easy-rsa

RUN apt-get install -y easy-rsa && make-cadir my_ca

RUN cp -r my_ca/* /etc/openvpn/easy-rsa

WORKDIR /etc/openvpn/easy-rsa

RUN mv openssl-1.0.0.cnf openssl.cnf
#Launch all of that
RUN /bin/bash -c "source ./vars && ./clean-all && ./build-ca --batch && ./build-key-server --batch server\
 ./build-key --batch client && ./build-dh && \
 cp keys/* /etc/openvpn/ && \
 cp /usr/share/doc/openvpn/examples/sample-config-files/client.conf /etc/openvpn/ &&\
 zcat /usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz > /etc/openvpn/server.conf && \
 cd ../ && openvpn --genkey --secret ta.key"

WORKDIR /etc/openvpn