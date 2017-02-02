FROM hypriot/rpi-alpine

RUN apk add --update \
    bash \
    git \
    autoconf \
    libtool \
    automake \
    build-base \
    gettext \
    cmake \
    && rm -rf /var/cache/apk/*

COPY build.sh /

WORKDIR /

RUN /bin/bash ./build.sh