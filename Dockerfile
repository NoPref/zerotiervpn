FROM zyclonite/zerotier

# Install OpenVPN dependencies (may require root privileges)
RUN apt-get update && apt-get install -y network-manager-openvpn iproute2 && apt-get clean

# Ensure the TUN module is loaded (this is a best-effort attempt)
RUN mkdir -p /dev/net && \
    [ -c /dev/net/tun ] || mknod /dev/net/tun c 10 200 && \
    chmod 600 /dev/net/tun

# Start ZeroTier
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
