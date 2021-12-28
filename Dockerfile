FROM alpine:latest

USER root

RUN sed -i -e 's/v[[:digit:]]\..*\//edge\//g' /etc/apk/repositories \
    && apk upgrade --update-cache --available \
    && mkdir /home/container

RUN apk add --update --no-cache curl ca-certificates nodejs npm openssl git tar sqlite fontconfig tzdata wine wget xvfb \
    && adduser -D -h /home/container container \
    && ln -s /etc/localtime /etc/timezone

COPY ./entrypoint.sh /home/container/entrypoint.sh

RUN chmod a+X /home/container/entrypoint.sh && chown container:container /home/container/entrypoint.sh && cd /home/container && ls && sleep 5

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

RUN mkdir bdsx

RUN cd bdsx && \
    git init && \
    git config pull.ff only && \
    git remote add upstream https://github.com/bdsx/bdsx.git && \
    cd ../ && \
    ls

VOLUME [ "/home/container" ]

CMD ./entrypoint.sh