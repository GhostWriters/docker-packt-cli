FROM alpine:3.12

LABEL maintainer="GhostWriters"

ADD root /
RUN chmod +x /root/docker-entrypoint.sh
COPY /root/docker-entrypoint.sh /opt/docker-entrypoint.sh

RUN apk add --no-cache git py3-pip
RUN pip3 install packt --upgrade
RUN	rm -rf /var/cache/apk/*

ENTRYPOINT [ "/opt/docker-entrypoint.sh" ]
