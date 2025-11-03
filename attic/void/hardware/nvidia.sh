# Install the video Drivers

# Install NVIDIA proprietary drivers and Wayland support
sudo xbps-install --sync --yes nvidia nvidia-libs-32bit egl-wayland linux-headers

# Install required libraries
sudo xbps-install --sync --y mesa mesa-dri libglvnd

# If not loaded, load them manually
sudo modprobe nvidia
sudo modprobe nvidia_modeset
sudo modprobe nvidia_uvm
sudo modprobe nvidia_drm

# Create nvidai.conf
nvidia >> /etc/modules-load.d/nvidia.conf
nvidia_modeset > /etc/modules-load.d/nvidia.conf
nvidia_uvm > /etc/modules-load.d/nvidia.conf
nvidia_drm > /etc/modules-load.d/nvidia.conf

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

