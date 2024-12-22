FROM zyclonite/zerotier

# Install required packages using apk (Alpine's package manager)
RUN apk update && apk add --no-cache \
    openvpn \
    iproute2 \
    bash

# Ensure TUN device exists
RUN mkdir -p /dev/net && \
    [ -c /dev/net/tun ] || mknod /dev/net/tun c 10 200 && \
    chmod 600 /dev/net/tun

# Copy the startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
