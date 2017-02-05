FROM hypriot/rpi-alpine

RUN apk add --update \
    --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
    alpine-sdk \
    linux-headers \
    bash \
    tar \
    git \
    autoconf \
    libtool \
    automake \
    build-base \
    gettext \
    cmake \
    libgdiplus-dev \ 
    && rm -rf /var/cache/apk/*

COPY build.sh /

WORKDIR /

RUN /bin/bash ./build.sh
