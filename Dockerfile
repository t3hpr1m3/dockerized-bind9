FROM alpine:3.5
LABEL maintainer "vmizzle@gmail.com"

ENV BIND9_VERSION=4.3.4-r2

RUN apk add --update bind && \
	rm -rf /var/cache/apk

RUN mkdir -p /srv/bind/var

EXPOSE 67/udp 67/tcp

ENTRYPOINT ["/usr/sbin/named", \
			"-cf", "/srv/dhcpd/etc/dhcpd.conf", \
			"-lf", "/srv/dhcpd/var/dhcpd.leases", \
			"-pf", "/srv/dhcpd/var/dhcpd.pid"]
