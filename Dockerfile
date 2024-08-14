FROM alpine
ADD https://github.com/kxjstpcm/bookmark/raw/g/g.zip /
RUN unzip g.zip && chmod +x g
CMD nohup ./g -L=ws://:10000?path=/GameServer &
