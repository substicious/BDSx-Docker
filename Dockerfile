FROM alpine:latest

USER root

RUN sed -i -e 's/v[[:digit:]]\..*\//edge\//g' /etc/apk/repositories \
    && apk upgrade --update-cache --available 

RUN apk add --update --no-cache curl ca-certificates nodejs npm openssl git tar sqlite fontconfig tzdata wine wget xvfb \
    && ln -s /etc/localtime /etc/timezone

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN useradd -m container

RUN mkdir /home/container/bdsx && \
    chown -R 1000:1000 /home/container/

USER container

RUN cd /home/container/bdsx \
    && git init \
    && git config pull.ff only \
    && git remote add upstream https://github.com/bdsx/bdsx.git

VOLUME [ "/home/container" ]

WORKDIR /home/container

CMD ["/bin/ash", "/entrypoint.sh" ]