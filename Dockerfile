FROM alpine:3.12

LABEL maintainer="GhostWriters"

ADD root /
RUN chmod +x /opt/docker-entrypoint.sh

RUN apk add --no-cache py3-pip
RUN pip3 install packt
RUN pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U
RUN	rm -rf /var/cache/apk/*

ENTRYPOINT [ "/opt/docker-entrypoint.sh" ]
