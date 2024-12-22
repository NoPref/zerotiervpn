#!/bin/sh

# Start the ZeroTier service
zerotier-one &
sleep 5

# Join the ZeroTier network
zerotier-cli join ${ZEROTIER_NETWORK_ID}

# Enable IP forwarding
sysctl -w net.ipv4.ip_forward=1

# Get interfaces
ZT_IF=$(ip link show | grep zt | awk '{print $2}' | sed 's/://')
WAN_IF=$(ip route | grep default | awk '{print $5}')

# Configure NAT and forwarding
iptables -t nat -A POSTROUTING -o $WAN_IF -j MASQUERADE
iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i $ZT_IF -o $WAN_IF -j ACCEPT

# Keep the container alive
sleep infinity
