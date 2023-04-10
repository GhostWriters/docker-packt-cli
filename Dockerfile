FROM ghcr.io/linuxserver/baseimage-alpine:3.17-a17cd2f4-ls15

LABEL maintainer="GhostWriters"

COPY root /

RUN apk add --no-cache py3-pip \
  && pip3 install --no-cache-dir -r /opt/requirements.txt \
  && whoami

HEALTHCHECK none

ENTRYPOINT ["/opt/docker-entrypoint.sh"]
