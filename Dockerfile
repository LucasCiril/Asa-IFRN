FROM ubuntu:latest

RUN apt update

RUN apt upgrade  -y

RUN apt install dnsutils -y

CMD [ "/bin/bash"]