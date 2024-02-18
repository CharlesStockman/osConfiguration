#
# Create a user for the system.  The only initial difference between 
# the users will be the name 
#
# Data:
#    user -- The person responsible for this accont
#    uid -- not needed by default lowest value above UID_MIN will be used
#    group -- default to users
#    additional_groups -- more groups the user belongs to.
#    home_directory -- Directory where user keeps their files


user=$1
mainGroup="users"
additional_gid="audio cdrom floppy input lp netdev plugdev power scanner video wheel"
home_directory=/home/${user}
shell=/bin/zsh

#
# Adds the user 
#    -m  -- create the home directory
#
/usr/sbin/useradd -d $home_directory -m -g users -G audio,cdrom,floppy,input,lp,netdev,plugdev,power,scanner,video,wheel -s $shell $user
