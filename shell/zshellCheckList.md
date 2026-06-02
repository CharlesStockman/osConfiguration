# Checklist for Zshell Configuration
|Action|Notes|
|------|-----|
|Install Homebrew||
|Install Nerd Fonts|Used by other programs such as Prompt Creators|

<b>Directory Creation</b>
|Action|Notes|
|------|-----|
|$HOME/.config/zsh||
|$HOME/.config/zsh/plugins||
|export $ZDOTDIR and put in $HOME/.zsenv | value = $HOME/.config/zsh|

<b>The .config/zsh directory</b>
|Action|Notes|
|------|-----|
|move all files starting with .z into $HOME/.config/zsh |
|In $ZDOTDIR/.zprofile add typeset -U path | Removes duplicates from the $path and $PATH environemnt variable| 
|In $ZDOTDIR/.zprofie add to the front of path /opt/homebrew/bin | Get the brew versions of the executable since the version in the brew repository or more up to date.|
