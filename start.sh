#!/bin/sh

# Check if /dev/net/tun exists
if [ ! -c /dev/net/tun ]; then
    echo "ERROR: /dev/net/tun is not available. Exiting..."
    exit 1
fi

# Start ZeroTier
zerotier-one -d

# Join network
zerotier-cli join ${NETWORK_ID}

# Keep container alive
tail -f /dev/null
