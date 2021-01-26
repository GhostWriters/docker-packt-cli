FROM alpine:3.12

LABEL maintainer="GhostWriters"

RUN ls
ADD root /
COPY /root/docker-entrypoint.sh /opt/docker-entrypoint.sh
WORKDIR /root
RUN ls

RUN apk add --no-cache git py3-pip
RUN pip3 install packt --upgrade
RUN	rm -rf /var/cache/apk/*
RUN chmod +x /opt/docker-entrypoint.sh
RUN chmod +x /root/docker-entrypoint.sh

ENTRYPOINT [ "/opt/docker-entrypoint.sh" ]
