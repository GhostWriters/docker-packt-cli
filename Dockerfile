# Set the base image
FROM ghcr.io/linuxserver/baseimage-alpine:3.17@sha256:614c50e6b5196d63b7ffd999928dd12bac64ab910cb69c41a1355b113fba99ae

# Set the maintainer
LABEL maintainer="GhostWriters"

# copy local files
COPY root/ /

# Install required packages and application dependencies
RUN \
    echo "**** install runtime packages ****" && \
    apk add --no-cache \
    python3 && \
    echo "**** install app ****" && \
    python3 -m ensurepip && \
    pip3 install -U --no-cache-dir \
    pip \
    wheel && \
    pip3 install --no-cache-dir -r /opt/requirements.txt && \
    echo "**** cleanup ****" && \
    rm -rf \
    /tmp/* \
    "$HOME/.cache"

# Add a health check command to ensure the container is running correctly
HEALTHCHECK --interval=1m \
    --timeout=3s \
    CMD ps -ef | grep cron || exit 1

# ports and volumes
VOLUME /config
