# Introduction
The purpose is to describe the scripts that will be used to install the software and configure the system for a Nixtrux

## Prerequisite
A version of nitrux has been installed on a machine.

Setup mount the drive the configuraiton scripts
mkdir -p $HOME/git/
git clone https://github.com/CharlesStockman/osConfiguration.git

## Assumptions
git and flatpak is installed

## Flatpak
### Flatpak will be used for the following purposed
* To have a 64 bit system without the need of the 32 bit libraries to keep the system simplier
* Software that should tried all without installing it and all its dependecies ( easier to remove )
* Software that you only use once every few months or years

### Installation
* Execute osConfiguration/flatpak/configureFlatpak.sh
* Execute osConfiguration/flatpak/installSoftware.sh



  
