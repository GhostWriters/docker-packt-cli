FROM alpine:3.12

LABEL maintainer="GhostWriters"

ADD root /

RUN apk add --no-cache git py3-pip
RUN pip3 install packt --upgrade
RUN	rm -rf /var/cache/apk/*
RUN chmod +x ./root/docker-entrypoint.sh

ENTRYPOINT [ "/root/docker-entrypoint.sh" ]
