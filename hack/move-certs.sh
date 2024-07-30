#!/usr/bin/env bash

# Create necessary directories
sudo mkdir -p /etc/swanctl/x509 /etc/swanctl/x509ca /etc/swanctl/private

# Copy certificates and keys
sudo cp ca.crt /etc/swanctl/x509ca/
sudo cp vm1.crt vm2.crt /etc/swanctl/x509/
sudo cp vm2.key /etc/swanctl/private/

# Set ownership
sudo chown -R root:root /etc/swanctl

# Set permissions
# sudo chmod -R 600 /etc/swanctl
sudo chmod 755 /etc/swanctl
sudo chmod 755 /etc/swanctl/x509 /etc/swanctl/x509ca /etc/swanctl/private
sudo chmod 644 /etc/swanctl/x509ca/ca.crt /etc/swanctl/x509/*.crt
sudo chmod 600 /etc/swanctl/private/*.key
