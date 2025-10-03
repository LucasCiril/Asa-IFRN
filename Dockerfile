FROM ubuntu:latest

RUN apt update

RUN apt install dnsutils cowsay -y

CMD [ "/bin/bash" ]