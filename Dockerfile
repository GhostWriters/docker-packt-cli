FROM alpine:3.12
LABEL maintainer="GhostWriters"
ADD root /
COPY ./docker-entrypoint.sh /opt/docker-entrypoint.sh

RUN apk add --no-cache git py3-pip  && \
		pip3 install packt pyasn1 --upgrade  && \
		rm -rf /var/cache/apk/* && \
		chmod +x /opt/tracker-add-auto.sh

WORKDIR /root
ENTRYPOINT [ "/opt/docker-entrypoint.sh" ]
