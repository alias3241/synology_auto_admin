#!/bin/bash

# Step 1: Run on the Docker host (Synology NAS)

# Generate a random username (e.g., 'tempadmin_XXXXXXXXXX')
USERNAME="tempadmin_$(openssl rand -base64 6 | tr -dc 'a-zA-Z0-9')"

# Generate a random password for the temporary admin user
PASSWORD=$(openssl rand -base64 12)

# Create the random username with the generated password on the Synology NAS
sudo synouser --add "$USERNAME" "$PASSWORD" "Temporary Admin" 0 joe@bloggs.com 0

# Print the new username and password (for reference)
echo "New username: $USERNAME"
echo "New password for $USERNAME: $PASSWORD"

# Add the temporary user to the 'administrators' group
sudo synogroup --memberadd administrators "$USERNAME"

# Step 2: Run inside the Docker container 'acme.sh'

# Set the environment variables inside the container
docker exec acme /bin/sh -c "export SYNO_USERNAME='$USERNAME'; export SYNO_PASSWORD='$PASSWORD'; /usr/local/bin/acme.sh --deploy --deploy-hook synology_dsm -d example.com"

# Step 3: Cleanup on the Docker host (remove temporary admin user)
sudo synouser --del "$USERNAME"

