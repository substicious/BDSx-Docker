FROM alpine:latest

USER root

RUN sed -i -e 's/v[[:digit:]]\..*\//edge\//g' /etc/apk/repositories \
    && apk upgrade --update-cache --available 

RUN apk add --update --no-cache curl ca-certificates nodejs npm openssl git tar sqlite fontconfig tzdata wine wget xvfb \
    && ln -s /etc/localtime /etc/timezone \
    && addgroup -g 1000 container \
    && adduser -u 1000 -G container -D -h /home/container container

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN mkdir /home/container/bdsx && \
    chown -R 1000:1000 /home/container/

USER container

VOLUME [ "/home/container" ]

WORKDIR /home/container

CMD ["/bin/ash", "/entrypoint.sh" ]