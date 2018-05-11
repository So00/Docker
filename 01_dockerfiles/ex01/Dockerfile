#image
FROM debian

WORKDIR .

ADD http://dl.4players.de/ts/releases/3.1.3/teamspeak3-server_linux_amd64-3.1.3.tar.bz2 ./

RUN apt-get update &&\
 apt-get install -y bzip2 ca-certificates &&\
 tar jxf teamspeak3-server_linux_amd64-3.1.3.tar.bz2 &&\
 rm -f teamspeak3-server_linux_amd64-3.1.3.tar.bz2 &&\
 cd teamspeak3-server_linux_amd64

EXPOSE 3080
#lancer docker build -t vim .
#et ensuite docker run -it vim
