FROM alpine:3.12

LABEL maintainer="GhostWriters"

ADD root /
WORKDIR /root

RUN apk add --no-cache git py3-pip
RUN pip3 install packt pyasn1 --upgrade
RUN	rm -rf /var/cache/apk/*
RUN chmod +x docker-entrypoint.sh

ENTRYPOINT [ "docker-entrypoint.sh" ]
