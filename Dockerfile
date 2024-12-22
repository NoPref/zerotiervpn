FROM alpine:3.18.3

# Setup ZeroTier
WORKDIR /zerotier.d

COPY start.sh /zerotier.d/start.sh

ENV ZEROTIER_NETWORK_ID "<your_network_id>"
ENV ZEROTIER_HOSTNAME "railway-app"
ENV ZEROTIER_ADDITIONAL_ARGS ""

RUN apk update && \
    apk add --no-cache zerotier-one iptables ip6tables ca-certificates && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /var/run/zerotier /var/lib/zerotier

RUN chmod +x ./start.sh

CMD ["./start.sh"]
