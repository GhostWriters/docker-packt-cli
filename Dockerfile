FROM ghcr.io/linuxserver/baseimage-alpine:3.17

ARG PUID=1000
ARG PGID=1000
ENV PUID=${PUID} \
    PGID=${PGID}

LABEL maintainer="GhostWriters"

COPY root /

RUN apk add --no-cache py3-pip \
&& pip3 install --no-cache-dir packt

ENTRYPOINT ["/opt/docker-entrypoint.sh"]
