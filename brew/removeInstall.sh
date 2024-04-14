#
# Initial Install executables needed for software uninstallation.
# 
# Software Installed:
#    git -- Use to get the repsoitory containing uninstallation and configuraiton scripts 
#    jq  -- Used by the configuration to parse JSON
#    ansible -- Used to configure tools such as git
#    pass -- Command Line key manager for storing passwords and public accessTokens ( ex. github)
#    expect -- A program that automates programs that require input from the command line
#    zsh -- A shell
#    powerlevel10k -- A theme editor for zsh
#    zsh-autosuggestions =

brew uninstall git
brew uninstall ansible
brew uninstall jq
brew uninstall pass
brew uninstall expect
brew uninstall zsh
brew uninstall powerlevel10k
brew uninstall zsh-autosuggestions
brew uninstall zsh-fast-syntax-highlighting
brew uninstall --cask docker
