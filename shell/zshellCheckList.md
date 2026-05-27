# Checklist for Zshell Configuration
|Action|Notes|
|------|-----|
|Install Homebrew||
|Install Nerd Fonts|Used by other programs such as Prompt Creators|
|In $HOME/zstenv add ZDOTDIR | $HOME/.config/zsh and move all files starting with .z into there |
|In $ZDOTDIR/.zprofile add typeset -U path | Removes duplicated fromt he $path and $PATH environemnt variable| 
|In $ZDOTDIR/.zprofiel add to the front of path /opt/homebrew/bin | Get the brews versions of the executable which should be the same or greater version |
