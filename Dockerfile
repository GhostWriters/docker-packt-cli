FROM lsiobase/alpine.python
MAINTAINER GhostWriters
ADD root /
WORKDIR /root
RUN apk add --update git
RUN git clone https://github.com/igbt6/Packt-Publishing-Free-Learning.git
RUN pip install -r /root/Packt-Publishing-Free-Learning/requirements.txt

RUN groupadd -g $PGID PPuser && \
    useradd -u $PUID -g PPuser -m PPuser
USER PPuser

ENTRYPOINT ["/init"]
