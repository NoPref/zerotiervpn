#!/bin/sh

# Check if /dev/net/tun exists
if [ ! -c /dev/net/tun ]; then
    echo "ERROR: /dev/net/tun is not available. Exiting..."
    exit 1
fi

# Start ZeroTier
zerotier-one -d

# Join network
zerotier-cli join 48d6023c46b63da5

# Keep container alive
tail -f /dev/null

