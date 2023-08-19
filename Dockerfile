# Set the base image
FROM ghcr.io/linuxserver/baseimage-alpine:3.18@sha256:42a63a138572c2576af2996c4afd19e3513b3f237046cd386b8885d1d931c324

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
