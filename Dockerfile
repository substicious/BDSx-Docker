FROM alpine:latest

USER root

RUN sed -i -e 's/v[[:digit:]]\..*\//edge\//g' /etc/apk/repositories \
    && apk upgrade --update-cache --available 

RUN apk add --update --no-cache curl ca-certificates nodejs npm openssl git tar sqlite fontconfig tzdata wine wget xvfb \
    && adduser -D -h /home/container container \
    && ln -s /etc/localtime /etc/timezone \
    && mkdir /home/container/bdsx \
    && chown -R container:container /home/container/ \
    && chmod 775 -R /home/container/

COPY ./entrypoint.sh /entrypoint.sh

USER container

RUN git clone https://github.com/bdsx/bdsx.git /home/container/bdsx

ENV USER=container HOME=/home/container

VOLUME [ "/home/container" ]

WORKDIR /home/container

CMD [ "/bin/ash", "/entrypoint.sh" ]