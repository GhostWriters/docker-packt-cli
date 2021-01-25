FROM alpine:3.12

LABEL maintainer="GhostWriters"

ADD root /
WORKDIR /root

RUN apk add --no-cache git py3-pip  && \
		pip3 install packt pyasn1 --upgrade  && \
		rm -rf /var/cache/apk/* && \
		chmod +x docker-entrypoint.sh

ENTRYPOINT [ "docker-entrypoint.sh" ]
