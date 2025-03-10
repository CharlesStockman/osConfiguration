#
# Intstall and Configure DBUS
#
# Distributed IPC Mechanism used for prccess communication
#
xbps-install --yes dbus

# Enable the service 
ln -s /etc/sv/dbus /var/service

