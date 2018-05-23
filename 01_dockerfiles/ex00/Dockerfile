#image
FROM alpine

RUN apk update &&\
 apk add vim

WORKDIR .

EXPOSE 3000

ENTRYPOINT ["vim"]
#lancer docker build -t vim .
#et ensuite docker run -it vim
