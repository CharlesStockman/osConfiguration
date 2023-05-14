
[ -d $config_homeDirectory ] && rm -rf $config_homeDirectory

# Create an basic user
useradd $config_username 

# Add Group
#   kmem -- ability to read from /dev/mem /dev/port
#   wheel -- Elevated privileges for specific sytem administration tasks
#   tty -- Access to TTY-like devices ( /dev/tty*, /dev/pts*, /dev/port
#   daemon -- Systme daemons that need to write to files on disk
#   disk -- Raw access to /dev/sd* /dev/loop
#   audio -- Access to audio devices
#   video -- Access to video devices
#   utmp -- ability to write to /var/run/utmp,/varlog/wtmp, /var/log/btmp
#   storage -- Access to removeable storage devices
#   kvm -- Ability to use KVM for virtual machines, e.g via QEMU
#   input -- Access to /dev/mouse*, /dev/event	
#   docker -- Allow you to communicate with the docker daemon
usermod -a -G kmem cstockman
#usermod -a -G wheel cstockman
usermod -a -G tty cstockman
usermod -a -G daemon cstockman
usermod -a -G disk cstockman
usermod -a -G audio cstockman
usermod -a -G video cstockman
usermod -a -G utmp cstockman
usermod -a -G storage cstockman
usermod -a -G kvm cstockman
usermod -a -G input cstockman
usermod -a -G docker cstockman 

