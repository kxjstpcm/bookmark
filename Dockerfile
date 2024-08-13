FROM alpine

ENV VER=${VER}
ENV PASSWORD=${PASSWORD}

ADD https://github.com/ginuerzh/gost/releases/download/v${VER}/gost-linux-amd64-${VER}.gz /

RUN gzip gost-linux-amd64-${VER}.gz -d && chmod +x gost-linux-amd64-${VER}

CMD /gost-linux-amd64-${VER} -L ws://:10000?path=/${PASSWORD}
