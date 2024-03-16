#
# First file read to be read by zsh which should contain  epxorted variables that should be used by other programs.
# This program will be linked into the directory so when zsh is executed it will read the correct .zshenv
#

# fPATH -- A seperate file for putting reusable completions and functions
#fpath=( fpath=$(brew --prefix)/share/zsh-completions $fpath )

export ZDOTDIR=`ls -l $HOME/.zshenv | awk '{print $NF}' | xargs dirname`
