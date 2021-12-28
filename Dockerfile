FROM alpine:latest

USER root

RUN sed -i -e 's/v[[:digit:]]\..*\//edge\//g' /etc/apk/repositories \
    && apk upgrade --update-cache --available 

RUN apk add --update --no-cache freetype git nodejs npm wine gnutls ncurses-libs xvfb tzdata wget wine-mono \
    && ln -s /etc/localtime /etc/timezone \
    && addgroup -g 1000 container \
    && adduser -u 1000 -G container -D -h /home/container container

RUN wget https://dl.winehq.org/wine/wine-mono/6.1.1/wine-mono-6.1.1-x86.msi && \
    wget https://dl.winehq.org/wine/wine-gecko/2.47.2/wine-gecko-2.47.2-x86_64.msi

RUN wine64 msiexec /i wine-mono-6.1.1-x86.msi && \
    wine64 msiexec /i wine-gecko-2.47.2-x86_64.msi

RUN rm *.msi

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN mkdir /home/container/bdsx && \
    chown -R 1000:1000 /home/container/ && \
    chmod -R 775 /home/container/

USER container

VOLUME [ "/home/container" ]

WORKDIR /home/container

CMD ["/bin/ash", "/entrypoint.sh" ]