FROM ghcr.io/linuxserver/baseimage-alpine:3.17

LABEL maintainer="GhostWriters"

COPY root /

RUN apk add --no-cache py3-pip \
&& pip3 install --no-cache-dir packt \
&& whoami

HEALTHCHECK none

ENTRYPOINT ["/opt/docker-entrypoint.sh"]
