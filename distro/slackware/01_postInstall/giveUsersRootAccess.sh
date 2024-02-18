#
# Give all users on the system root access by removing the comment symbol 
# for the line that expect the wheel group for the user  and will not
# require a password for sudo.
#
sed -i 's/#\s%wheel ALL=(ALL:ALL) NOPASSWD: ALL/%wheel ALL=(ALL:ALL) NOPASSWD: ALL/g' /etc/sudoers 

