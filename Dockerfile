# Set the base image
FROM ghcr.io/linuxserver/baseimage-alpine:3.17@sha256:2de8b98739351279deab6d05c422f9349901cac43b8bb01d454e172190738cb7

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
HEALTHCHECK --interval=15m \
    --timeout=3s \
    CMD ps -ef | grep cron || exit 1 \
    && ping -c 1 www.packtpub.com >/dev/null 2>&1 || exit 1

# Volume where the config file and crontab
VOLUME /config
