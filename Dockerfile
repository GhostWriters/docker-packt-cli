# Set the base image
FROM ghcr.io/linuxserver/baseimage-alpine:3.23@sha256:4caa670c0e273161cec0d29b3652d5bc0c1d62b8b0dfba9f51c2d455c5dd71a7

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
