# Use a base Ubuntu image
FROM ubuntu:22.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    strongswan \
    strongswan-swanctl \
    strongswan-starter \
    libcharon-extra-plugins \
    net-tools \
    iputils-ping \
    tcpdump \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Expose necessary ports
EXPOSE 500/udp 4500/udp

# Keep the container running without starting strongSwan
CMD ["tail", "-f", "/dev/null"]
