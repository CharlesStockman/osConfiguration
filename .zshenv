#
# First file read to be read by zsh which should contain  epxorted variables that should be used by other programs.
# This program will be linked into the directory so when zsh is executed it will read the correct .zshenv
#

echo "--- Currently executing .zshenv ---"
    
export PATH=/opt/homebrew/bin:$config_linuxConfiguration/distro/$config_distro:$PATH 

# fPATH -- A seperate file for putting reusable completions and functions
fpath=( fpath=$(brew --prefix)/share/zsh-completions $fpath )


echo "--- Finished executing .zshenv --- "

echo "Have set \"fPATH\" and \"XDG_HOME\" and \"XDG_DATA_HOME\" and \"XDG_CACHE_HOME\" "
