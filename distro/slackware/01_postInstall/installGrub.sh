#
# Install the boot loader grub
# 
grub-install --target=x86_64-efi --efi-directory=/boot/efi bootloader=id-grub
grub-mkconfig -o /boot/grub/grub.cfg
