FROM alpine

ENV VER=2.11.5
ENV PASSWORD=GameServer

ADD https://github.com/ginuerzh/gost/releases/download/v2.11.5/gost-linux-amd64-2.11.5.gz /

RUN gzip gost-linux-amd64-2.11.5.gz -d && chmod +x gost-linux-amd64-2.11.5

CMD /gost-linux-amd64-2.11.5 -L ws://:10000?path=/GameServer
