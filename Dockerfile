#BDSx-Docker:Alpine-Dev

FROM alpine:latest

#Procede as Root
USER root

#Add edge repos to Docker
RUN sed -i -e 's/v[[:digit:]]\..*\//edge\//g' /etc/apk/repositories \
    && apk upgrade --update-cache --available

RUN apk add --update --no-cache freetype git nodejs npm wine gnutls ncurses-libs xvfb tzdata mono winetricks
