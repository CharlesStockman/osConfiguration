#
# Intstall and Configure DBUS
#
# IPC mechanism used by ysersoace siftware ub KUbyx
#
xbps-install --yes dbus

# Enable the service 
ln -s /etc/sv/dbus /var/service

