#BDSx-Docker:Alpine-Dev

FROM alpine:latest

#Procede as Root
USER root

#Add edge repos to Docker
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk upgrade --update-cache --available

RUN apk add --update --no-cache freetype git nodejs npm wine gnutls ncurses-libs xvfb tzdata mono winetricks
