# Use the official ZeroTier Docker image
FROM zyclonite/zerotier

# Create necessary directories
RUN mkdir -p /var/run/zerotier /var/lib/zerotier

# Set permissions
RUN chmod +x /var/lib/zerotier

# Add your start script
COPY start.sh /zerotier.d/start.sh
RUN chmod +x /zerotier.d/start.sh

# Expose necessary ports (if required by your network setup)
EXPOSE 9993/udp

# Start ZeroTier
CMD ["/zerotier.d/start.sh"]
