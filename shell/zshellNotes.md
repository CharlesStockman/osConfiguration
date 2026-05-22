# Introduciton

Notes on the zshell.

<b>References</b>
- <a href="https://github.com/rothgar/mastering-zsh/tree/master" target="_blank">Zsh Reference</a>
# Important Files

|File|Purpose|
|----|-------|
|.zprofile | login-only setup (SSH, servers, TTY) |

# My Configuration of ZShell

## Change the location of the zdot files
Changing the location of the dotfiles to match the linux standard of having the dotfiles reside in the .conf directory to keep the config files all in on place.

Using this configuration since the future plans are to use a command like chemzoi to manage the configuration file across multiple machines or use a tool from NIX or GUIX to manage my configuration

```
mkdir $HOME/.config/zsh
echo "export ZDOTDIR=$HOME/.config/zsh" >> .zshenv
mv .zsh_history $ZDOTDIR
mv .zsh_sessions $ZDOTDIR
# mv any other .z* files except .zshenv ( since it will set the location of the zshell configuration and other files )
```
