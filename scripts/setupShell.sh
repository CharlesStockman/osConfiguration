#
# setup the shell envioronemnt files  
#

# Create a directory to move the dot files to a safe location when they are overwritten
[ ! -d $HOME/movedFiles ] && mkdir $HOME/movedFiles
 
#
# Move the oringal .zshrc/.zshenv so they will not be deleted
#
mv $HOME/.zshenv $HOME/movedFiles
mv $HOME/.zshrc  $HOME/movedFiles

# Create the absoltue path for the shell dotfiles 
zshenv="$config_osConfigurationDirectory/dotfiles/zsh/.zshenv"
zshrc="$config_osConfigurationDirectory/dotfiles/zsh/.zshrc"

# linke the startup files for zsh.
ln -s $zshenv $HOME/.zshenv
ln -s $zshrc  $HOME/.zshrc
