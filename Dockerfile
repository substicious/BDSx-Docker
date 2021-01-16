FROM alpine:latest AS BUILDER

ENV BASE='/opt/BDSx-2/' \
    BDS='/opt/BDSx-2/bedrock_server/' \
    BDSX='/opt/BDSx-2/bdsx/' \
    EXAMPLE='/opt/BDSx-2/example_and_test/' \
    DATA='/data/'

RUN mkdir -p /opt/BDSx-2/ && \
    mkdir -p /data/

RUN apk add tar unzip wget

RUN wget https://github.com/karikera/bdsx/archive/2.0.tar.gz -P /root/ && \
    tar -xzf /root/2.0.tar.gz && \
    ls && \
    sleep 10