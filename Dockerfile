FROM alpine:3.12
LABEL maintainer="GhostWriters"
ADD root /
WORKDIR /root
RUN apk add --update git
RUN pip3 install packt --upgrade

ENTRYPOINT ["/init"]
