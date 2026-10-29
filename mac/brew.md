## Purpose
Homebrew is a package manager for macOS and linux.  It lets you easily install, update, and manage software from the command line that doesn't come pre-installed on your Mac.
The core idea: Instead of hunting down websites, downloading installers, and dragging apps around, you just type a command like: 
```
brew install git
```
and Homebrew handles everything — downloading, installing, and setting <b>git</b> up correctly.

## Installation

### Macintosh
<b>Prerequisite: Verify that xcode has been installed</b>

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#
# Setup the environment for homebrew
# Modify a new and then from another window execute zsh to have the brew configuration setup.
#

# Dumps all the shell commands need to configure the environment for brew.
# Try brew shellenv and observe what get displayed.
echo 'eval "${/opt/homebrew/bin/brew shellenv zsh}"' >> $HOME/.zshrc
```

### Linux
<b>Prerequisite: None</b>

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#
# Setup the environment for homebrew
# Modify a new and then from another window execute zsh to have the brew configuration setup.
#

# Dumps all the shell commands need to configure the environment for brew.
# Try brew shellenv and observe what get displayed.
echo 'eval "${/home/linuxbrew/.linuxbrew/bin/brew shellenv}"' >> $HOME/.zshrc
```

## Commands
|Command| Description|
|-------|------------|
|brew doctor| Checks your system for potential problems that could cause Homebrew or installed packages to misbehave.|
|brew install <package-name>| Downloads the package binary and install and configures. |
|brew install hello| Verifies that homebrew is installed correctly|
|brew search <string> | Search through the formula and casks for the string in the package names. |

## brew services Subcommands

Usage: `brew services <subcommand> postgresql@16`<br>
postgresql@16 is being used as an example

| Subcommand | Command | Description |
|------------|---------|-------------|
| `start` | `brew services start postgresql@16` | Start the service formula immediately and register it to launch at login (or boot). |
| `stop` | `brew services stop postgresql@16` | Stop the service formula immediately and unregister it from launching at login (or boot). |
| `run` | `brew services run postgresql@16` | Run the service formula without registering it to launch at login (or boot). |
| `restart` | `brew services restart postgresql@16` | Stop (if necessary) and start the service formula immediately and register it to launch at login (or boot). |
| `kill` | `brew services kill postgresql@16` | Stop the service formula immediately but keep it registered to launch at login (or boot). |
| `list` | `brew services list` | List information about all managed services for the current user (or root). |
| `info` | `brew services info postgresql@16` | List all managed services for the current user (or root). |
| `cleanup` | `brew services cleanup` | Remove all unused services. |

## brew services Options

| Option | Description |
|--------|-------------|
| `-d`, `--debug` | Display any debugging information. |
| `-q`, `--quiet` | Make some output more quiet. |
| `-v`, `--verbose` | Make some output more verbose. |
| `-h`, `--help` | Show this message. |
| `--sudo-service-user` | When run as root on macOS, run the service(s) as this user. |

## Notes

- Use `brew services run postgresql@16` instead of `start` if you only want Postgres running for this session and not at every login.

## Specific Installs
### Nerd Fonts
Install all the nerd fonts

```
brew search '/font-.*-nerd-font/' | awk '{ print $1 }' | xargs brew install
```

## Software Installed
<ul>
  <li>libreOffice</li>
  <li>mole -- mac specific</li>
  <li>nerdfonts</li>
  <li>intellij community edition -- Most compfortable with this editor</li9>
  <li>helix+++</li>
</ul>
