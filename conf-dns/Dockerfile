FROM ubuntu:latest

RUN apt update -y && apt install bind9 dnsutils -y

RUN mkdir -p /etc/bind && chown -R bind:bind /etc/bind

COPY named.conf.lab /etc/bind/named.conf
COPY named.conf.options /etc/bind/named.conf.options
COPY db.siteA.lab /etc/bind/db.siteA.lab
COPY db.siteB.lab /etc/bind/db.siteB.lab

EXPOSE 53/tcp
EXPOSE 53/udp

CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]