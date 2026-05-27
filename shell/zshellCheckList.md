# Checklist for Zshell Configuration
|Action|Notes|
|------|-----|
|Install Homebrew||
|Install Nerd Fonts|Used by other programs such as Prompt Creators|
|In $HOME/zstenv add ZDOTDIR | $HOME/.config/zsh and move all files starting with .z into there |
|In $ZDOTDIR/.zprofile add typeset -U path | Removes duplicates from the $path and $PATH environemnt variable| 
|In $ZDOTDIR/.zprofiel add to the front of path /opt/homebrew/bin | Get the brew versions of the executable since the version in the brew repository or more up to date.|
