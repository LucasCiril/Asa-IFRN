FROM ubuntu:latest

RUN apt update

RUN apt install dnsutils -y

CMD [ "/bin/bash" ]