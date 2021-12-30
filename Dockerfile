#BDSx-Docker:Alpine-Dev

FROM alpine:latest

#Procede as Root
USER root

#Add edge repos to Docker
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories  

RUN apk add freetype git nodejs npm wine wine-mono gnutls ncurses-libs xvfb tzdata \
    && ln -s /etc/localtime /etc/timezone \
    && addgroup -g 1000 container \
    && adduser -u 1000 -G container -D -h /home/container container

RUN chown -R 1000:1000 /home/container 

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod a+X /entrypoint.sh \
    && chown 1000:1000 /entrypoint.sh

USER container
ENV USER=container HOME=/home/container

RUN mkdir /home/container/BDSx \
    && chown -R 1000:1000 /home/container \
    && chmod 775 -R /home/container 

WORKDIR /home/container/BDSx

VOLUME [ "/home/container/" ]

CMD [ "/bin/ash", "/entrypoint.sh" ]