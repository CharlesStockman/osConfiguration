# Purpose

## Create a Github Access Key 
Create the key that will act as the password fro GitHub.
[Create a Github Access Key ](git/README.md)

## Assumptions
<b>Assumption : A Unix OS such as Cygwin, Mac OS, Linux has been installed</b><br>
<b>Assumption : Location of choice will be $HOME/Developer, <code>export osConfigurationParentDir = $HOME/Developer</code>

## Steps

### clone osConfiguration ( contains scripts and Documents (xml and json ) to the new machine
&emsp;<code>cd $osConfigurationParentDir</code><br>
&emsp;<code>git clone https://github.com/CharlesStockman/osConfiguration.git</code><br>

### Install Software 
The purpose of this section is to install the software. The Software will be installed in one of two ways
<li>Intall the Software and use the configurtion scripts</li>
<li>Use Nix Configuration to install and configure.</li>

### Configuring the Basic Components of the System

|Configuration                                           | Explanation                                                                           |
|--------------------------------------------------------|---------------------------------------------------------------------------------------|
| Load Configuration                                     | The JSON Tools that allow tailoring of the configuring to the user's preferences<br>[Instructions](configure/basic/configure)     |
| Generating the Public and Private Key For Your System  | Provides encryption for pass and files.<br>[Instructions](configure/basic/gnuPrivacyGuard) |
| Create the Pass Storage and Add the Initial Passwords  | Set up encrypted storage for you passwords so they are secure  and accessiable<br>[Instructions](configure/basic/pass)        |
| The purpose of this section is to set git global configuration varaiables using an ansible script. | The variables are described in the git.yaml<br>[Instructions](configure/basic/git) |	

#### Starting TMUX ( A terminal multiplexer ) 
A terminal multiplexer that allows the creation of pseudo terminals inside a single terminal.  It allows the terminal
to be split into multiple terminals  

<b>Favorite Commands</b>

|Command|Description|
|-------|-----------|
|Ctrl B and Any Arrow Key | directionally move to the next pane |
|Ctrl B and Z         | Zoom into a single pseudo terminal and zoom out|

> * cd into linuxConfiguration/dotfiles/tmux
> * Execute the alias tmuxStd

#### Setting up Python Virtual Environment for Ansible 
I chose to install a Python Virtual Environment instead of using the package manager so that I could install ansible when the rest of the packages were installed.
> Exeucte sh osConfiguration/pythonVirtualEnvironments/create_venv_ansible.sh<br>
> <bold>Notes</bold>

>>  Activate the virtual enviornment
>>> Execute chmod 744 osConfiguration/pythonVirtualEnvironments/venv-ansible/bin/activate so the script can be executed
>>> Active the python virtual environment: source osConfiguration/pythonVirtualEnvironments/venv-ansible/bin/activate

>> Deactivate the Virtual Environment
>>> Deactivate the python virtual enviornment: deactivate

