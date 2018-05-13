#docker build -t teamspeak .
#docker run -d --name ts3 -p 9987:9987/udp -p 30033:30033/tcp -p 10011:10011/tcp teamspeak
FROM debian

WORKDIR .

ADD http://dl.4players.de/ts/releases/3.1.3/teamspeak3-server_linux_amd64-3.1.3.tar.bz2 ./

RUN	apt-get update &&\
	apt-get install -y bzip2 ca-certificates &&\
	tar jxf teamspeak3-server_linux_amd64-3.1.3.tar.bz2 &&\
	rm -f teamspeak3-server_linux_amd64-3.1.3.tar.bz2 &&\
	useradd ts


ENV	TS3SERVER_LICENSE=accept

WORKDIR teamspeak3-server_linux_amd64

USER ts

EXPOSE 10011
EXPOSE 9987/udp
EXPOSE 30033
EXPOSE 41144

ENTRYPOINT ["sh", "ts3server_minimal_runscript.sh", "createinifile=1"]
