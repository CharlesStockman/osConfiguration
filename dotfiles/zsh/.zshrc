
# zsh-completions -- https://github.com/zsh-users/zsh-completions
# autload -Uz compinit
#   autoload -- Marks the name being a function  
#       compinit -- When found will be loaded as a funciton.  The function name will be the name of the file.
#       -U -- supress alias exapnsion
#       -z -- use the zsh stype -- need more research
#       Why using aloto load and not source compinit
#		Avoids name conflicts if you have an executable with the same name
# 		-U supress alias expansion
#		lazy loading which increases speed of ZSH startup
# If you get zsh compinit: insecure direcotries run compaudit for list then execute compaudit | xargs chmod g-w,o-w
#  You may also need to force rebuild `zcompdump`: -- rm -f ~/.zcompdump; compinit
# Example: cp - will show all the command line options for a command
autoload -Uz compinit && compinit
zstyle ':compeltion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' # To make completion case insensitive.

#
# Some program will require a text editor or to display text
# 
export EDITOR='vim'
export VISUAL='vim'

#
# Load the aliases
#
. `pwd`/.posix_aliases

#
# Zsh Directory Stack
#
setopt AUTO_PUSHD		# Push the current directory visited on the stack
setopt PUSHD_IGNORE_DUPS	# Do not store duplicates in the stack
setopt PUSHD_SILENT		# Do not print the direcotry stack after pusehd or popd


# Shell Options
# Set -- setopt AUTO_CD
# unset -- unsetopt AUTO_CD / set +o auto_cd
# setopt -- displays options
setopt NO_CASE_GLOB		# Globbing is case insensitive
setopt AUTO_CD			# No need to add cd

setopt HIST_EXPIRE_DUPS_FIRST	# Remove duplicates first
setopt HIST_IGNORE_DUPS		# Do not store duplications
setopt HIST_FIND_NO_DUPS	# Ignore duplicates when searching
setopt HIST_REDUCE_BLANKS	# Remove blank lines form histrory
setopt EXTENDED_HISTORY 	# provides a timestamp for the output of history


# History 
HISTFILE=$HOME/.zsh_history
SAVEHIST=10000              # Number of commands to remember in .zsh_history
HISTSIZE=2000		    # Number of commands to remember in the session



#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# Load Angular CLI autocompletion.
# source <(ng completion script)

# Path to the chromedriver for selenium
export PATH=$PATH:/opt/homebrew/bin/chromedriver
