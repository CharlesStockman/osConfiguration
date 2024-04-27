#
# Purpose : set nvidia-drm.mode to 1
#
# Nvidia does not support  "automatic KMS late loading" enableing kernel mode setting is required to make Waylannd compositors function properly or to allow Xorg#Rootless Xorg
#
# Kernel Mode Setting ( KMS )
#    Makes fancy graphics during bootup
#    virtual console and X fast switching possible
#
# DRM ( Direct Rendering Mnaager ) -- a subsytem of the linux kernel responsible for interfacing with GPUs.  DRM Expose an API that user-space program can use to send commands and data to the GPU Card
#

# Exlanation of the command
# 	sed -i: This tells sed to edit the file in place.
# 	s/: This indicates that we're performing a substitution.
# 	\(GRUB_CMDLINE_LINUX="\): This is a capturing group that matches the beginning of the GRUB_CMDLINE_LINUX variable, including the opening double quote.
# 	\(.*\)": This is a capturing group that matches any characters until the closing double quote.
# 	\1\2 nvidia-drm.modeset=1": This replaces the matched string with the original GRUB_CMDLINE_LINUX value (captured by \1\2) followed by nvidia-drm.modeset=1 and a closing double quote.#

sudo sed -i 's/\(GRUB_CMDLINE_LINUX="\)\(.*\)"/\1\2 nvidia-drm.modeset=1"/' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg


