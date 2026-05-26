# Introduciton

Notes on the zshell.

<b>References</b>
- <a href="https://github.com/rothgar/mastering-zsh/tree/master" target="_blank">Zsh Reference</a>
# Important Files

## Description of files
|File|Purpose|
|----|-------|
|.zshenv|Set the location of where the Zsh Config files, history and session are found |
|.zprofile | login-only setup (SSH, servers, TTY) |

## Load Order
|File|When loaded |
|--------------|------------------|
|/etc/zshenv   |Every shell       |
|~/.zshenv     |Every shell       |
|/etc/zprofile |Login shells      |
|~/.zprofile   |Login shells      |
|~/.zshrc      |Interactive shells|

# Built In Commands
|Command|Description|Documentation|
|-------|-----------|-------------|
|fc     |Command working with history | [Documentation](https://shapeshed.com/unix-fc/) |

# My Configuration of ZShell

## Change the location of the zdot files
Changing the location of the dotfiles to match the linux standard of having the dotfiles reside in the .conf directory to keep the config files all in on place.

Using this configuration since the future plans are to use a command like chemzoi to manage the configuration file across multiple machines or use a tool from NIX or GUIX to manage my configuration

```
mkdir $HOME/.config/zsh
echo "export ZDOTDIR=$HOME/.config/zsh" >> .zshenv
mv .zsh_history $ZDOTDIR
mv .zsh_sessions $ZDOTDIR/.zsh_sessions
# mv any other .z* files except .zshenv ( since it will set the location of the zshell configuration and other files )
```
