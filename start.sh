#!/bin/sh

# Start ZeroTier service
zerotier-one &

# Wait for ZeroTier to initialize
sleep 5

# Join your network
zerotier-cli join 48d6023c46b63da5

# Keep the container running
tail -f /dev/null
