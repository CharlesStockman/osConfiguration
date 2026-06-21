# Install the Grub Boot Loader

grub-install --target=x86_64-efi --efi-directory=/boot/efi bootloader-igrub

grub-mkconfig -o /boot/grub/grub.cfg
