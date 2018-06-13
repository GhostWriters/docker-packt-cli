FROM lsiobase/alpine.python
MAINTAINER GhostWriters
ADD root /
WORKDIR /root
RUN git clone https://github.com/igbt6/Packt-Publishing-Free-Learning
RUN cd Packt-Publishing-Free-Learning && git checkout add-cfgpath-argument
RUN pip install -r /root/Packt-Publishing-Free-Learning/requirements.txt
ENTRYPOINT ["/init"]

