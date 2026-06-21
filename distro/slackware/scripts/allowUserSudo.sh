#
# provide a user with root privileges 
#

userName=$1
sudoersFile="/etc/sudoers.d/$userName"

echo "$userName ALL=(ALL) ALL" >> $sudoersFile
chmod 440 $sudoersFile
