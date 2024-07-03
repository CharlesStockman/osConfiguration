# Purpose 
|Component|Description|
|---------------|--------------------------------------------------------------------------------------------------|
|Actor          |The Nix Package Manager                                                                           |
|Flow           |Path 1 : Make the Modifications and the packages will install normally using non systemd software |
|Pre-Conditions |The Actor ( Nix Package Manager ) uses Systemd only                                               |
|Post-Condition |The Actor ( Nix Package Manager ) now can use openrc and the installation still works             |

# Assumptions

# High Level Deisgn

## List of Questions to be anwered.
<b>Two ways to approach the problem</b>
<ol>
<li>Use Nix Package Manager to download the software and a script that will make the modifications</li>
<li>Integrate the changes into NixOS Directly</li>
<li>Could the Packages be converted from Nix to GUIX </li>
</ol>

## Solutions

### Create a Virtual Machine for NixOs
The virtual machine will be used for exploration of systemd and how it configures the system.  Through out this experiment we will need multiple versions of Nix Os.<br/><br/>
<b>Different versions of the Nix OS</b>
<ol>
<li>NixOs with Grub and Shell</li>
</ol>

### Either create script or modify Nix OS to convert to a Non SystemD
### Convert SystemD-Grub to Grub only
#### Start Services Using OpenRC instead of SystemD
#### Convert the Services to Start using OpenRC


### Convert Nix Packages Not Present In GUIX
Create a script that will download all the package metadata from the GUIX and Nix and find a way to match packages that are the same.  Currently I believe the URL will be best solution.
Then do an analysis and look for the percentage correct and way to increate the correct percentage.


