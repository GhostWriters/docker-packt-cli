# Set the base image
FROM ghcr.io/linuxserver/baseimage-alpine:3.24@sha256:e17494fc7ec17c64f1b502d52705aa99d7a1cd8ccf59bb7b36003db89d97d2c6

# Set the maintainer
LABEL maintainer="GhostWriters"

# copy local files
COPY root/ /

# Install required packages and application dependencies
RUN \
    echo "**** install runtime packages ****" && \
    apk add --no-cache \
    py3-pip && \
    echo "**** install app ****" && \
    pip3 install --break-system-packages --no-cache-dir -r /opt/requirements.txt && \
    echo "**** cleanup ****" && \
    rm -rf \
    /tmp/* \
    "$HOME/.cache"

# Add a health check command to ensure the container is running correctly
HEALTHCHECK --interval=15m \
    --timeout=3s \
    CMD ["sh", "-c", "ps -ef | grep cron || exit 1 && ping -c 1 www.packtpub.com >/dev/null 2>&1 || exit 1"]

# Volume where the config file and crontab
VOLUME /config
