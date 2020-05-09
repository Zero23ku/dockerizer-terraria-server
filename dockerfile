FROM alpine:3.9.6
ENV WORLD=default.wld
ENV MAXPLAYERS=16
ENV PORT=7777 
ENV AUTOCREATE=3
USER root
RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk add --update mono@testing unzip  \
    && rm -rf /var/cache/apk/*
RUN mkdir tshock
WORKDIR /tshock
RUN wget -O tshock.zip 'https://github.com/Pryaxis/TShock/releases/download/v4.3.26/tshock_4.3.26.zip'
ADD start-server.sh start-server.sh
#ENTRYPOINT mono TerrariaServer.exe -port ${PORT} -worldpath /opt/Terraria/world -world /opt/Terraria/world/${WORLD} -maxplayers ${MAXPLAYERS} -autocreate ${AUTOCREATE}
ENTRYPOINT [ "sh","start-server.sh" ]





