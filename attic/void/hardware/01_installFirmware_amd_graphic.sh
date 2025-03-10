#
# Install the firmware for the AMD Chipset 
#

xbps-install --sync --yes linux-firmware-amd

#
# For the opengl and using the Direct Rendering Managers
# 
xbps-install --yes mesa-dri

#
# Vulkan 
#
xbps-install --yes vulkan-loader
xbps-install --yes amdvlk

#
# Vidio Acceleration
#
xbps-install --yes mesa-vaapi
xbps-install --yes mesa-vdpau
