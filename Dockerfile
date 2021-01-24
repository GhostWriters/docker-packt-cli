FROM python:3.8.0-slim
LABEL maintainer="GhostWriters"
ADD root /
WORKDIR /root
RUN apk add --update git
RUN pip3 install packt --upgrade

ENTRYPOINT ["/init"]
