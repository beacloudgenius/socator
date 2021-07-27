FROM alpine:3.14
MAINTAINER Nilesh

ADD ./tor-socat.sh /
ADD ./torrc /etc/tor/torrc

RUN apk update \
	&& apk upgrade  \
	&& apk add tor socat \
	&& rm -rf /var/cache/apk/* \
	&& chmod +x /tor-socat.sh

EXPOSE 5000

ENTRYPOINT ["/tor-socat.sh"]
