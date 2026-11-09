#
# provide a user with root privileges 
#

userName=$1
sudoersFile="/etc/sudoers.d/$userName"

if [ -z "$userName" ]; then
       echo "Username not supplied on the command line"
       echo "Usage: sh ./allowUserSudo.sh <username>"
       exit -1 
fi

echo "$userName ALL=(ALL) ALL" >> $sudoersFile
chmod 440 $sudoersFile
