FROM alpine:latest AS BUILDER

ENV BASE='/opt/BDSx-2/' \
    BDS='/opt/BDSx-2/bedrock_server/' \
    BDSX='/opt/BDSx-2/bdsx/' \
    EXAMPLE='/opt/BDSx-2/example_and_test/' \
    DATA='/data/' \
    REPO='/opt/gitRepo/'

RUN mkdir -p /opt/BDSx-2/ && \
    mkdir -p /data/ && \
    mkdir -p /opt/gitRepo/

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk update

RUN apk add freetype git mono nodejs npm wine wine-mono bash

RUN git clone https://github.com/bdsx/bdsx.git /opt/BDSx-2/

RUN rm /opt/BDSx-2/*.bat && \
    rm -rf /opt/BDSx-2/docker

RUN chmod +X $BASE/bdsx.sh && echo "Done"

EXPOSE  19132/UDP \
        19133/UDP

RUN ln -sb /opt/BDSx-2/* /data

WORKDIR $BASE

VOLUME [ "/opt/BDSx-2/" ]

CMD ["/bin/bash", "bdsx.sh" ]
