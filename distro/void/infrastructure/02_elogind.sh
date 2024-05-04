#
# Install and configure elogoind
#
# Manages necesssary features foir most desktop environments and Wayland compsoitors and set XDG Environment Variables
#

xbps-install --yes elogind

# Start the server
ln -s /etc/sv/elogind /var/service


