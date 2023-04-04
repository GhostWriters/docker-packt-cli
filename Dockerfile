FROM ghcr.io/linuxserver/baseimage-alpine:3.17

LABEL maintainer="GhostWriters"

COPY root /

RUN chmod +x /opt/docker-entrypoint.sh \
&& apk add --no-cache py3-pip \
&& pip3 install --no-cache-dir packt

ENTRYPOINT ["/opt/docker-entrypoint.sh"]
