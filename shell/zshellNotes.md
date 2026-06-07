# Introduciton

Notes on the zshell.

<b>References</b>
- <a href="https://github.com/rothgar/mastering-zsh/tree/master" target="_blank">Zsh Reference</a>
# Important Files

## Description of files
|File|Purpose|
|----------|----------------------------------------------------------------|
|.zshenv   |loaded for every shell.  Contains universal variables           |
|.zprofile | path and environmental variables for the interactive session   |
|.zshrc    | Aliases, functions, prompt, plugins defined for a specfic user |

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

# Differences between $path and $PATH
In zsh, they are two views of the same data — zsh automatically keeps them in sync:

|Property | $PATH                      | $path                                  |
|---------|----------------------------|----------------------------------------|
|Type     | String	                             | Array                        |
|Format   |	"/usr/bin:/usr/local/bin"            | ("/usr/bin" "/usr/local/bin")|
|Separator|	Colon-delimited                      | Space-separated elements     |
|Origin   |	POSIX standard (works in all shells) | zsh-specific                 |

# Alias

## Example 1 -- Combining two alias
alias ss='sudo '<br>
alias g='git'<br>
ss g would produce sudo git<br>

## Example 2 -- If an alias conflicts with the name of a command it can be escaped with quotes
alias grep='grep --color=auto'<br>
echo foo | grep fo    # uses grep --color=auto alias from the previous line<br>
echo foo | 'grep' fo #  uses the actual grep command<br>

## Example 3 -- Alias where the name is more than letters and numbers 
alias :q=exit<br>
alias ..='cd ..'<br>
alias --='cd -'<br>

## Example 4 -- Global Alias
alias -g G='| grep'<br>
echo -e 'zsh\nis\n\great\nhello\ngoodbye' G -A1 hello C      # grep for hello and include 1 line after<br>

## Example 5 -- Global Alias
alias -g G='| grep'
alias -g W='| wc -l'
alias -g GfooW='G foo W'          # Expands to | grep fool | wc -l

# Key Bindings 
Zsh's line editor (ZLE) intercepts keypresses and maps them to widgets — functions that manipulate the command line.

| Command | Description |
|---------|-------------|
|bindkey -L| Display all the keybindings|



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
