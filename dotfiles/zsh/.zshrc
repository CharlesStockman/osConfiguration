#
# Zsh Configuration
#

# Command and Command Line Options Completion
#zstyle :compinstall filename '/tmp/chuck.c'
autoload -Uz compinit && compinit

# History 
setopt HIST_IGNORE_ALL_DUPS	# Do not store duplicate lines in the "HISTFILE" 
setopt HIST_FIND_NO_DUPS	# Ignore duplicates when searching using the shell
setopt HIST_REDUCE_BLANKS	# Remove blank lines form history
setopt EXTENDED_HISTORY 	# provides a timestamp for the output of history
setopt INC_APPEND_HISTORY       # command are added to the "HISTFILE" immediately 


# History 
HISTFILE=$ZDOTDIR/.zsh_history
SAVEHIST=10000000           # Number of commands to have to the "HISTFILE"
HISTSIZE=2000		    # Number of commands to remember in the session
