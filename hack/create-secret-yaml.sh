#!/usr/bin/env bash

 Check if all required files exist
required_files=("ca.crt" "vm1.crt" "vm1.key" "vm2.crt" "vm2.key")
for file in "${required_files[@]}"; do
    if [ ! -f "$file" ]; then
        echo "Error: $file not found in the current directory"
        exit 1
    fi
done

base64_encode() {
    base64 | tr -d '\n'
}

# Create the Secret YAML
cat << EOF > strongswan-secret.yaml
apiVersion: v1
kind: Secret
metadata:
  name: strongswan-secrets
type: Opaque
data:
  ca.crt: $(cat ca.crt | base64_encode)
  vm1.crt: $(cat vm1.crt | base64_encode)
  vm1.key: $(cat vm1.key | base64_encode)
  vm2.crt: $(cat vm2.crt | base64_encode)
  vm2.key: $(cat vm2.key | base64_encode)
EOF

echo "Secret YAML file 'strongswan-secret.yaml' has been created successfully."