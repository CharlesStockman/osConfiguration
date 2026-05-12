## Purpose
Homebrew is a package manager for macOS.  It lets you easily install, update, and manage software from the command line that doesn't come pre-installed on your Mac.
The core idea: Instead of hunting down websites, downloading installers, and dragging apps around, you just type a command like: 
```
brew install git
```
and Homebrew handles everything — downloading, installing, and setting <b>git</b> up correctly.

## Installation
<b>Prerequisite: Verify that xcode has been installed</b>

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#
# Setup the environment for homebrew
# Modify a new and then from another window exeucte zsh to have the brew configuration setup.
#

# Dumps all the shell commands need to configure the environemnt for brew.
# Try brew shellenv and observe what get displayed.
echo 'eval "${/opt/homebrew/bin/brew shellenv zsh}"' >> $HOME/.zshrc
```

## Commands
|Command| Description|
|-------|------------|
|brew doctor| Checks your system for potential problems that could cause Homebrew or installed packages to misbehave.|
|brew install <package-name>| Downloads the package binary and install and configures for the system |
|brew search <string> | Search through the formula and casks for the string in the package names. |
