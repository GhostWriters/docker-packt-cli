# Set the base image
FROM ghcr.io/linuxserver/baseimage-alpine:3.17

# Set the maintainer
LABEL maintainer="GhostWriters"

# Install required packages and application dependencies
RUN \
    echo "**** install runtime packages ****" && \
    apk add --no-cache \
    python3 && \
    echo "**** install app ****" && \
    python3 -m ensurepip && \
    pip3 install -U --no-cache-dir \
    pip \
    wheel \
    packt && \
    echo "**** cleanup ****" && \
    rm -rf \
    /tmp/* \
    $HOME/.cache

# Add a health check command to ensure the container is running correctly
HEALTHCHECK --interval=1m \
    --timeout=3s \
    CMD ps -ef | grep cron || exit 1

# copy local files
COPY root/ /

# ports and volumes
VOLUME /config
