#!/bin/tcsh

# Purpose to install and configure dao

# Install Daos
pkg install daos

# Setup Configuration File /usr/local/etc/daos.conf and permissions.
cat > /usr/local/etc/doas.conf << 'EOF'
# Allow wheel group members to execute commands as root without  password
permit persist nopass :wheel
EOF

sudo chown root:wheel /usr/local/etc/doas.conf
sudo chmod 0600 /usr/local/etc/doas.conf

# Parse and Check the /usr/local/etc/daos.conf 
doas -C /usr/local/etc/doas.conf
if ($status != 0) then
    echo "echo "$0 -- /usr/local/doas.conf has syntax error"
endif




