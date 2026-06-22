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

# Completions
## Completions
After writing part of the command press tab twice and a list of all the options will appear

## Auto Suggestion
Will Compare what was typed in to the history and will provide a list of suggestions.

## Highlighting

## ZStyle
General purpose key-value configuration system built into zsh. 
Completion uses it heavily, but any zsh subsystem can use it.

# Functions
|Command|Description|
|-------|-----------|
|whence -f \<function name\>| Print a function |
|whence -v \<function name\>| Shows the absolute path of function|

# Variables
## Parameters
Variables are a subset of shell parameters which have lots of different values and types. 
### Examples
|Command|Description|
|-------|-----------|
| echo $! | The pid of the last backgrounded command |
| echo $$ | The pid of this shell |
| echo $? | The exit status returned by the last command |
| echo $_ | The last argument to the previous command |
| echo $RANDOM | Pseudo-random integer from 0 to 32767 |
| echo $n | Positional parameter passed to script |

## Parameter Substituion
${variable action value} syntax where a punctuation mark denotes an action and a string, variable, or command for value. 

|Substitution|Description|
|------------|-----------|
|${var:-foo}        | substitute var with foo if it is unset or set to an empty string |
|${var:s/foo/bar}   | replace foo for bar (same as ${var/foo/bar} in bash) |
|${var:h}           | leave "head" of variable path (same as dirname ${var} or ${str%/*} in bash) |
|${var:t}           | leave "tail" of variable path (same as basename or ${str##*/} in bash) |
|${var:l}           | convert variable to lowercase (this is ${var,,} in bash) |
|${var:u} = convert | variable to UPPERCASE (this is ${var^^} in bash) |

<b>Example</b>
```
for FILE in $(ls -1); do
    # :r takes filename and removes extension
    # :e takes extension without filename
    # :l lowercases text
    mv ${FILE} ${FILE:r}.${FILE:e:l}
done
```
