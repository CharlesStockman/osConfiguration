#
# Purpose to chroot into manin operating system and mount the USB ( copy files ) to configure the system
#
# mkdir -p      used so no error messages are displayed about directories already created.
# mountpoint -q used so no error messages are displayed about mountpoints already created. 
#
# The USB that is being mount will also be the second USB inserted.
#
chroot /mnt /bin/bash -c '
	mkdir -p /media/transfer
	mountpoint -q /media/transfer || mount /dev/sdb1 /media/transfer
	exec /bin/bash
'
