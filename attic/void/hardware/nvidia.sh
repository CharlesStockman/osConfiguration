# Install the video Drivers

# Install NVIDIA proprietary drivers and Wayland support
sudo xbps-install -S nvidia nvidia-libs-32bit egl-wayland

# Install required libraries
sudo xbps-install -S mesa mesa-dri libglvnd

# If not loaded, load them manually
sudo modprobe nvidia
sudo modprobe nvidia_modeset
sudo modprobe nvidia_uvm
sudo modprobe nvidia_drm

to /etc/modules-load.d/nvidia.conf

cat << /etc/modules-load.d/nvidia.conf > EOF
nvidia
nvidia_modeset
nvidia_uvm
nvidia_drm
EOF

