#
# Initial Install executables needed for software installation.
# 
# Software Installed:
#    git -- Use to get the repsoitory containing installation and configuraiton scripts 
#    jq  -- Used by the configuration to parse JSON
#    ansible -- Used to configure tools such as git
#    pass -- Command Line key manager for storing passwords and public accessTokens ( ex. github)

brew install git
brew install ansible
brew install jq
brew install pass
brew install expect
