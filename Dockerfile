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
    && addgroup -g 1000 container \
    && adduser -u 1000 -G container -D -h /home/container container

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

USER container
ENV USER=container HOME=/home/container

RUN chown -R container:container /home/container/BDSx \
    && chmod 775 -R /home/container

WORKDIR /home/container/BDSx

RUN git init
RUN git config pull.ff only
RUN git remote add upstream https://github.com/bdsx/bdsx.git

VOLUME [ "/home/container/" ]

CMD [ "/bin/ash", "/entrypoint.sh" ]