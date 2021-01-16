FROM alpine:latest AS BUILDER

ENV BASE='/opt/BDSx-2/' \
    BDS='/opt/BDSx-2/bedrock_server/' \
    BDSX='/opt/BDSx-2/bdsx/' \
    EXAMPLE='/opt/BDSx-2/example_and_test/' \
    DATA='/data/'

    