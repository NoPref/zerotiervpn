#!/bin/sh

# Start ZeroTier service
zerotier-one -d

# Wait for ZeroTier to initialize
sleep 5

# Join the network
zerotier-cli join 48d6023c46b63da5

# Enable relay mode
zerotier-cli set 48d6023c46b63da5 allowManaged=0
zerotier-cli set 48d6023c46b63da5 allowGlobal=0
zerotier-cli set 48d6023c46b63da5 allowDefault=0

# Keep container running
tail -f /dev/null
