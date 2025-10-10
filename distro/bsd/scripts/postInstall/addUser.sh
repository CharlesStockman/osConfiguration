#! /bin/tcsh

if ( $#argv == 2 ) then
    echo "$0 needs two arguments ( -u, --username ) and ( -p, --password )
    exit 1
endif

while ( $#argv > 0 )
    switch ($argv[1])
        case "-u":
        case "--user":
            shift argv
            set username = "$argv[1]"
            breaksw
        case "-p":
        case "--password":
            shift argv
            set password = "$argv[1]"
            breaksw
        default:
            echo "$0 -- Error: Unknown option $argv[1]"
            exit 1
    endsw
    shift argv
end

set groups=""

# Create user with all options specified
# -n username          : Username (login name)
# -c "Full Name"       : Full name (GECOS field/comment)
# -u 1234              : UID (user ID), will not use to allow pw to choose an uid
# -g logingroup        : Primary login group (default: same as username) 
#                      :     will not use -g to allow pw to choose since for now this script will only create reglar users
# -G wheel,operator    : Additional groups (comma-separated)
# -L default           : Define resource limits and environment settings for groups of users
# -s /bin/tcsh         : Shell
# -d /home/bob         : Home directory path
# -m                   : Create home directory if it doesn't exist
# -h 0                 : Read password from stdin (or -h - for no password set)

# Create user and set password in one step
echo "$userpass" | doas pw useradd \
    -n $username \
    -g $username \
    -G $groups \
    -L default \
    -s /bin/tsch \
    -d /home/$username \
    -m \
    -h 0
    
if ($status == 0) then
    echo "User $username created with password"
    doas pw usershow $username
else
    echo "$0 -- Failed to create user"
    exit 1
endif
