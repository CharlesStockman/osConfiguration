#
# To create a virtualized environment to boot the fressbsd iso
#
filename="freebsd_reference_implementation.raw"
if [ ! -f $filename ]; then
   #
   # Create a empty image
   #   -f raw -- create the raw format which is simple and easily exported to other emulators
   qemu-img create -f $filename 100G 
fi
