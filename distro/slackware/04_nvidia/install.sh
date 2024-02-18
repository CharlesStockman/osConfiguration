#
# Install nvidia drivers.
#
# This will not be done yet since I have to get Hyprland to work easily with
#

# Blacklist nouveau
cat <<EOF | sudo tee /etc/modprobe.d/blacklist-nouveau.conf
blacklist nouveau
options nouveau modeset=0
EOF

# Install nvidia for the kernel install driver
sboinstall -r nvidia-kernel
sboinstall -r nvidia-driver

installpkg /tmp/nvidia*.tgz

#
# Setup the XWindows Configuration 
#
nvidia-xconfig
