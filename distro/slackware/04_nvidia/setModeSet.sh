#
# Purpose : set nvidia-drm.mode to 1
#

# Exlanation of the command
# 	sed -i: This tells sed to edit the file in place.
# 	s/: This indicates that we're performing a substitution.
# 	\(GRUB_CMDLINE_LINUX="\): This is a capturing group that matches the beginning of the GRUB_CMDLINE_LINUX variable, including the opening double quote.
# 	\(.*\)": This is a capturing group that matches any characters until the closing double quote.
# 	\1\2 nvidia-drm.modeset=1": This replaces the matched string with the original GRUB_CMDLINE_LINUX value (captured by \1\2) followed by nvidia-drm.modeset=1 and a closing double quote.#

sudo sed -i 's/\(GRUB_CMDLINE_LINUX="\)\(.*\)"/\1\2 nvidia-drm.modeset=1"/' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg


