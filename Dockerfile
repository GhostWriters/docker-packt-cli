FROM python:3.9-slim-buster
LABEL maintainer="GhostWriters"
ADD root /
WORKDIR /root
RUN apk add --update git
RUN pip3 install packt --upgrade

ENTRYPOINT ["/init"]
