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
	
This secton will document the configuration that I consider most important.  At this point the areas that I consider important are the following:
In summary the intial tasks are tailoring to the specfic user, secureity ( encryption and password storage ), and backup ( git ).

|Configuration                                           | Explanation                                                                           |
|--------------------------------------------------------|---------------------------------------------------------------------------------------|
| Load Configuration                                     | The JSON Tools that allow tailoring of the configuring to the user's preferences      |
| Generating the Public and Private Key For Your System  | Provides encryption for pass and files.                                               |
| Create the Pass Storage and Add the Initial Passwords  | Set up encrypted storage for you passwords so they are secure  and accessiable        |
| Configure Git                                          | Configure Git to serve as backup since most of my artifacts are code/documentaiton    |
	
#### Load Configuration
The purpose of this section is to create a configuration file that can tailor the configuraton using metadata about the environment and user.
For example full_name and home_directory are two of the pieces of information that is provided by the file.

The administrator or the user should edit the following file "$HOME/git/osConfiguration/basic/description.json".  <b>Do not put description.json into the GIT repository since there is personal information in the file.</b>

|Command                                                                                  | Explanation                                                                                                |
|-----------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------|
| Edit description.json                                                                   | Fill in the needed information to describe the user an envioronment                                        |
| `~/git/osConfiguration/configure/basic/configure/jsonToEnv.sh` data/description.json`|  convert description.json into a collection of environmental variables which start with the prefix: config_|
	
#### <b>For Mac Only -- </b>Intialize Global Environemnt Variables -- Macintosh Launchctl is not setting my environment variable(s)
* cd into osConfiguration/dotfiles<br>
* sh ./fixMacCreateSetEnv.sh<br>
* Select Menu Item Terminal -> Quit Terminal<br>
* Open a new terminal and thses variables will be set<br>

#### Generating the Public and Private Key For Your System
The public and private key allows software to be encrypted and decrypted.  

The public key is used to encrypt so the key is given to another user or executable that will encrypt the information
The private key is used by the owner to decrypt the software
	
|Command                                                   | Explanation                                                                           |
|----------------------------------------------------------|---------------------------------------------------------------------------------------|
| cd  ~/osConfiguration/configure/basic/gnuPrivacyGuard |                                                                                       | 
|` sh ./configure.sh`                                      | Creates the public and private key for the devloper                                   |
|` . ./getPublicKey.sh                                     | Assigns the public key to the environmental varible : config_gpg_public_key           |
|` sh ./create_trust.sh                                    | Set "Ultimate Trust' for the GPG id.                                                  |

#### Create the Pass Storage and Add the Initial Passwords
pass is a program that will securely store passwords anad allow the owner to access them.  The only require,emt is to install and configure gpg 
as detailed above.
	
|Command                                                           | Explanation                                                                           |
|------------------------------------------------------------------|---------------------------------------------------------------------------------------|
| cd ~/git/linuxConfiguration/configrue/basic/gnuPrivacyGuard      |                                                                                       |
|` sh ./configurePass.sh`                                          | Setup the password database                                                           |
|` sh ./addFirstPassword.sh                                        | Add the initial passwords to the database                                             |

### Configurre Git
The purpsoe of this section is to set git global configuration varaiables using an ansible script.  The variables are described in the git.yaml
	
|Command                                                 | Explanation                                                                           |
|--------------------------------------------------------|---------------------------------------------------------------------------------------|
| cd ~/git/linuxConfiguration/configure/basic/git        |                                                                                       |
| ansible-playbook git.yaml                              | Run the Tasks needed to confgiure the git global variable int he git.yml              |
	

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

