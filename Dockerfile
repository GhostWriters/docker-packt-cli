# Set the base image
FROM ghcr.io/linuxserver/baseimage-alpine:3.20@sha256:4395d897dd1d287a0fe10a0c05b10d33a18fbe422eee1e36c829ba5b57ea2ac4

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
    CMD ps -ef | grep cron || exit 1 \
    && ping -c 1 www.packtpub.com >/dev/null 2>&1 || exit 1

# Volume where the config file and crontab
VOLUME /config
