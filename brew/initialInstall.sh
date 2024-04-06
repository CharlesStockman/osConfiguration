#
# Initial Install executables needed for software installation.
# 
# Software Installed:
#    git -- Use to get the repsoitory containing installation and configuraiton scripts 
#    jq  -- Used by the configuration to parse JSON
#    ansible -- Used to configure tools such as git
#    pass -- Command Line key manager for storing passwords and public accessTokens ( ex. github)
#    expect -- A program that automates programs that require input from the command line
#    zsh -- A shell
#    powerlevel10k -- A theme editor for zsh
#    zsh-autosuggestions =

brew install git
brew install ansible
brew install jq
brew install pass
brew install expect
brew install zsh
brew install powerlevel10k
brew install zsh-autosuggestions
brew install zsh-fast-syntax-highlighting
