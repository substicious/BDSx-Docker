#BDSx-Docker:Alpine-Dev

FROM alpine:latest

#Procede as Root
USER root

#Add edge repos to Docker
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk upgrade --update-cache --available

RUN apk add --update --no-cache freetype git nodejs npm wine wine-mono gnutls ncurses-libs xvfb tzdata mono \
    && ln -s /etc/localtime /etc/timezone \
    && addgroup -g 1000 container \
    && adduser -u 1000 -G container -D -h /home/container container

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN mkdir /home/container/BDSx && \
    chown -R 1000:1000 /home/container/

USER container

WORKDIR /home/container/BDSx

RUN git init
RUN git config pull.ff only
RUN git remote add upstream https://github.com/bdsx/bdsx.git

VOLUME [ "/home/container/" ]

CMD [ "/bin/ash", "/entrypoint.sh" ]