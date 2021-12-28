FROM alpine:latest

USER root

RUN sed -i -e 's/v[[:digit:]]\..*\//edge\//g' /etc/apk/repositories \
    && apk upgrade --update-cache --available 

RUN apk add --update --no-cache curl ca-certificates nodejs npm openssl git tar sqlite fontconfig tzdata wine wget xvfb \
    && adduser -D -h /home/container container \
    && ln -s /etc/localtime /etc/timezone

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container/

COPY ./entrypoint.sh ./entrypoint.sh

RUN mkdir bdsx

WORKDIR /home/container/bdsx

RUN git init
RUN git config pull.ff only
RUN git remote add upstream https://github.com/bdsx/bdsx.git

WORKDIR /home/container

VOLUME [ "/home/container" ]

COPY ./entrypoint.sh /home/container/entrypoint.sh

CMD [ "/bin/ash", "entrypoint.sh" ]