# Installation

This is a distro that is not aimed at the beginner, but the more experienced user so my suggestion is to use the void handbook to install the distro -- [Void Handbook](https://docs.voidlinux.org/)


## Post Install

<b>Assumptions</b>
<ul>
  <li>The Root User is being used for configuration</li>
  <li>Access to the wired conneciton is wired</li>
  <li>The sysetm has just been installed ( I don't think have an affect, but I added just in case )</li>
  <ul>
    <li>For a new install root will only have two aliased so ". ./aliases.sh; alias" is executed it is easier to see the new aliases</li>
  </ul>
</ul>

### Download osConfiguraiton which contains the installation scripts

```
xbps-install --sync --update --yes git

mkdir $HOME/git
cd clone
git clone https://github.com/CharlesStockman/osConfiguration.git
```

### Source the aliases 
```
cd $HOME/git/distro/void/general
. ./aliases.sh
```

### Creating 
