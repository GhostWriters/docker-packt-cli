FROM alpine:3.12

LABEL maintainer="GhostWriters"

ADD root /
RUN chmod +x /opt/docker-entrypoint.sh

RUN apk add --no-cache py3-pip
RUN pip3 install packt

ENTRYPOINT [ "/opt/docker-entrypoint.sh" ]
