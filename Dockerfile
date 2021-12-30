#BDSx-Docker:Alpine-Dev

FROM alpine:latest

#Procede as Root
USER root

#Add edge repos to Docker
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk upgrade 

RUN apk add freetype git nodejs npm wine wine-mono gnutls ncurses-libs xvfb tzdata mono \
    && ln -s /etc/localtime /etc/timezone \
    && adduser -D -h /home/container container

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod a+X /entrypoint.sh \
    && chown -R container:container /home/container \
    && chmod 775 -R /home/container


USER container
ENV USER=container HOME=/home/container

RUN mkdir /home/container/BDSx \
    && chown -R container:container /home/container \
    && chmod 775 -R /home/container 

WORKDIR /home/container/BDSx

VOLUME [ "/home/container/" ]

CMD [ "/bin/ash", "/entrypoint.sh" ]