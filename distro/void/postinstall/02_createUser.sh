#
# Create a non root user
#

user=$1
mainGroup=users
additional_groups="wheel,tty,audio,video,optical,storage,kvm,input,plugdev"
home_directory=/home/$1
shell=/bin/bash

useradd -d $home_directory -m -g $mainGroup -G $additional_groups -s $shell $user
