# Purpose

Distrohopping is a fact of life for linux users.  I am working on making it easier.  The basic idea is there are three steps 
to building a linux enivronment.  The thr        ee steps are:

> * Install the sofware from multiple repositories including arch, pip and docker
> * retrieve dotifles
> * configure the linux system using scripts

By Separating the intallation of the software from the configuration, the configuration script(s) are written once and we can have multiple installation scripts where each installation script for a linux distribution.

## Steps

<b>Assumption : A linux configuration or Mac OS has been installed</b>

### Copy linuxConfiguration to the new machine

<b>Source</b>
> * `git clone https://github.com/CharlesStockman/linuxConfiguration.git`
> * copy linuxConfigruation to a USB

<b>Destination</b><br>
> 
> <b>Create a non-root user if none are pressent</b>
> |Command                   		| Explanation                                                             |
> |-------------------------------------|-------------------------------------------------------------------------|
> | log in as root                      |                                                                         |
> |`useradd stockman`        		| Create a user with cstockman and has default group/home directory/shell |
> |`passwd cstockman`         		| Add a password so the user can log in.                                  |
> |`usermod -a -G wheel cstockman`      | Modify user cstockman append the Group wheel to his list of groups      |

> <b> Copy Linux Configuration to a non root user</b>
> |Command                   		              | Explanation                                                             |
> |---------------------------------------------------|-------------------------------------------------------------------------|
> | log in as root                                    |                                                                         |
> | `mkdir /mnt/transfer`                             |                                                                         |
> | `mount /dev/sda1 /mnt/transfer`                   | Mount the removable disk                                                |
> | `mkdir $HOME/git`                                 | location where linuxConfiguration will reside                           |
> | `log in as non-root user`                         |                                                                         |
> | `cp -r /mnt/tranfer/linuxConfigurarion $HOME/git` |                           

### Install Software 
The purpose of this section is to install the software.  When this section is complete the developer will have all the software on the system needed to configure the system.  Alot of distros have their own GUI programs for configuring the software.  However, I chose to use the commands line programs themselves so only one set of scripts will be needed to configure any linux distro or OSX.

Note that installAll requrires one parameeter which is the JSON file that contains all the software needed to be installed.  This file will be 
found in linuxconfiguration/distro/<specific distro>/repository.json

#### Install All the Software
|Command                                                 | Explanation                                                                           |
|--------------------------------------------------------|---------------------------------------------------------------------------------------|
|`su root`                                               | Change user to root since software is installed on linux by root.                     |
| `cd ~/git/linuxConfiguration/distro/<specific distro>` | change directory into the directory needed for the next two steps                     |
| `. ./commands.sh`                                      | Load functions to install the software for specific distro into the shell environemnt |
| `setup`                                                | Install a needed dependencies to execute insallAll                                    |
| `installAll <repsository.json>`                        | Installs all the software from the repository                                         |
| `exit`                                                 | Leaves the root shell                                                                 |

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

The administrator or the user should edit the following file "$HOME/git/linuxConfiguration/basic/description.json".  <b>Do not put description.json into the GIT repository since there is personal information in the file.</b>

|Command                                                                                  | Explanation                                                                                                |
|-----------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------|
| Edit description.json                                                                   | Fill in the needed information to describe the user an envioronment                                        |
| `~/git/linuxConfiguration/configure/basic/configure/jsonToEnv.sh` data/description.json`|  convert description.json into a collection of environmental variables which start with the prefix: config_|
	
#### <b>For Mac Only -- </b>Intialize Global Environemnt Variables -- Macintosh Launchctl is not setting my environment variable(s)
* cd into linuxConfiguration/dotfiles<br>
* sh ./fixMacCreateSetEnv.sh<br>
* Select Menu Item Terminal -> Quit Terminal<br>
* Open a new terminal and thses variables will be set<br>

#### Generating the Public and Private Key For Your System
The public and private key allows software to be encrypted and decrypted.  

The public key is used to encrypt so the key is given to another user or executable that will encrypt the information
The private key is used by the owner to decrypt the software
	
|Command                                                   | Explanation                                                                           |
|----------------------------------------------------------|---------------------------------------------------------------------------------------|
| cd  ~/linuxConfiguration/configure/basic/gnuPrivacyGuard |                                                                                       | 
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
> Exeucte sh linuxConfiguration/pythonVirtualEnvironments/create_venv_ansible.sh<br>
> <bold>Notes</bold>

>>  Activate the virtual enviornment
>>> Execute chmod 744 linuxConfiguration/pythonVirtualEnvironments/venv-ansible/bin/activate so the script can be executed
>>> Active the python virtual environment: source linuxConfiguration/pythonVirtualEnvironments/venv-ansible/bin/activate

>> Deactivate the Virtual Environment
>>> Deactivate the python virtual enviornment: deactivate

