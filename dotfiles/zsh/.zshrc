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

# Configure the prompt using powerlevel-10k
# To customize prompt, run `p10k configure` or edit ~/origGit/osConfiguration/dotfiles/zsh/.p10k.zsh.
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/origGit/osConfiguration/dotfiles/zsh/.p10k.zsh ]] || source ~/origGit/osConfiguration/dotfiles/zsh/.p10k.zsh
