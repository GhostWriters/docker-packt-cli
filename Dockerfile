FROM ghcr.io/linuxserver/baseimage-alpine:3.17-a17cd2f4-ls15

LABEL maintainer="GhostWriters"

COPY root /

RUN apk add --no-cache py3-pip=22.3.1 && \
    pip3 install --no-cache-dir packt==1.7.0 && \
    whoami

ENTRYPOINT ["/opt/docker-entrypoint.sh"]
