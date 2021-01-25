FROM alpine:3.12

LABEL maintainer="GhostWriters"

ADD root /
COPY /root/docker-entrypoint.sh /opt/docker-entrypoint.sh
WORKDIR /root

RUN apk add --no-cache git py3-pip
RUN pip3 install packt pyasn1 --upgrade
RUN	rm -rf /var/cache/apk/*
RUN chmod +x /opt/docker-entrypoint.sh

ENTRYPOINT [ "/opt/docker-entrypoint.sh" ]
