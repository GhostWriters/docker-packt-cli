FROM alpine:3.12

LABEL maintainer="GhostWriters"

ADD root /
WORKDIR /root

RUN apk add --no-cache py3-pip
RUN pip3 install packt --upgrade
RUN	rm -rf /var/cache/apk/*

ENTRYPOINT [ "/opt/docker-entrypoint.sh" ]
