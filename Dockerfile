FROM lsiobase/alpine.python3
LABEL maintainer="GhostWriters"
ADD root /
WORKDIR /root
RUN apk add --update git
RUN pip install packt --upgrade

ENTRYPOINT ["/init"]
