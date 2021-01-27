FROM alpine:3.12

LABEL maintainer="GhostWriters"

ADD root /
RUN ls -lh
WORKDIR /root

RUN apk add --no-cache py3-pip
RUN pip3 install packt --upgrade
RUN	rm -rf /var/cache/apk/*
RUN chmod +x /opt/docker-entrypoint.sh

ENTRYPOINT [ "/opt/docker-entrypoint.sh" ]
