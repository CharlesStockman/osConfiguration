#
# Give the user root access by changing sudoers
#

sed -i 's/#\s%wheel ALL=(ALL:ALL) NOPASSWD: ALL/%wheel ALL=(ALL:ALL) NOPASSWD: ALL/g' /etc/sudoers

