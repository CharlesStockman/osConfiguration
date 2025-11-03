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

# Add nvidia-drm.modeset=1 if not already present
if ! grep -q "nvidia-drm.modeset=1" /etc/default/grub; then
    sudo sed -i 's/^\(GRUB_CMDLINE_LINUX_DEFAULT="[^"]*\)"/\1 nvidia-drm.modeset=1"/' /etc/default/grub
    echo "Added nvidia-drm.modeset=1 to GRUB config"
else
    echo "nvidia-drm.modeset=1 already present"
fi

# or on some systems:
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Make sure you're in the right groups
sudo usermod -aG video,input,root $USER

