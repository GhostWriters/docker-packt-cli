FROM lsiobase/alpine.python3
LABEL maintainer="GhostWriters"
ADD root /
WORKDIR /root
RUN apk add --update git
RUN pip install git+https://github.com/luk6xff/Packt-Publishing-Free-Learning.git@master

ENTRYPOINT ["/init"]
