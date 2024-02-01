#
# A script to setup our files for out zsh shell 
#

mv $HOME/.zshenv $HOME/movedFiles
mv $HOME/.zshrc  $HOME/movedFiles

# Create the absoltue path for the log files 
zshenv="$osConfigurationDir/osConfiguration/dotfiles/zsh/.zshenv"
zshrc="$osConfigurationDir/osConfiguration/dotfiles/zsh/.zshrc"

# linke the startup files for zsh.
ln -s $zshenv $HOME/.zshenv
ln -s $zshrc  $HOME/.zshrc

 
