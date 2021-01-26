FROM alpine:3.12

LABEL maintainer="GhostWriters"

ADD root /
COPY /root/docker-entrypoint.sh /opt/docker-entrypoint.sh

RUN apk add --no-cache git py3-pip
RUN pip3 install packt --upgrade
RUN	rm -rf /var/cache/apk/*
RUN chmod +x /opt/docker-entrypoint.sh

ENTRYPOINT [ "/opt/docker-entrypoint.sh" ]
