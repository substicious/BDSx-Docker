FROM alpine:latest AS BUILDER

ENV BASE='/opt/BDSx-2/' \
    BDS='/opt/BDSx-2/bedrock_server/' \
    BDSX='/opt/BDSx-2/bdsx/' \
    EXAMPLE='/opt/BDSx-2/example_and_test/' \
    DATA='/data/' \
    REPO='/opt/gitRepo/'

RUN mkdir -p /opt/BDSx-2/ && \
    mkdir -p /data/ \
    mkdir -p /opt/gitRepo/

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk update

RUN apk add git mono nodejs npm tar wget wine wine-mono

RUN git clone https://github.com/karikera/bdsx.git /opt/BDSx-2/

RUN cd $BASE && ls && sleep 15

#RUN rm -rf /bdsx-2.0/* 2.0.tar.gz

#RUN rm /opt/BDSx-2/bdsx.bat /opt/BDSx-2/bdsx(pause at end).bat