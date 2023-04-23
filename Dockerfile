# Set the base image
FROM ghcr.io/linuxserver/baseimage-alpine:3.17

# Set the timezone
ARG TZ=Europe/London
ENV TZ=$TZ

# Set the maintainer
LABEL maintainer="GhostWriters"

# Copy files from host to container
COPY root /

# Install required packages and application dependencies
RUN apk update && apk add --no-cache py3-pip tzdata && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    pip3 install --no-cache-dir packt==1.7.0

# Update UID and GID of existing user "abc" to match PUID and PGID if supplied
ARG PUID=1000
ARG PGID=1000
RUN if [ "$PUID" -ne 1000 ] || [ "$PGID" -ne 1000 ]; then \
    usermod -u $PUID abc && \
    groupmod -g $PGID abc; \
    fi

# Set user "abc" as default user
USER abc

# Add a health check command to ensure the container is running correctly
HEALTHCHECK --interval=1m \
    --timeout=3s \
    CMD ps -ef | grep cron || exit 1

# Specify the entrypoint
ENTRYPOINT ["/opt/docker-entrypoint.sh"]
