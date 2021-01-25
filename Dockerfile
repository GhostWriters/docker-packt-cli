FROM alpine:3.12
LABEL maintainer="GhostWriters"
ADD root /
WORKDIR /root
COPY ./docker-entrypoint.sh /opt/docker-entrypoint.sh

RUN apk add --no-cache git py3-pip  && \
		pip3 install packt pyasn1 --upgrade  && \
		rm -rf /var/cache/apk/* && \
		chmod +x /opt/tracker-add-auto.sh

ENTRYPOINT [ "/opt/docker-entrypoint.sh" ]
