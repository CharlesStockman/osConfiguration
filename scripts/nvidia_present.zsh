#!/usr/bin/env zsh


#
# Determine if the nvidia graphics cards is present.
#
# exit codes
#    0		Nvidia Card found
#    1          Nvidia Card not found
#    2          Invalid Paramteter
#    255 (-1)   Show help
#

#
#  Put a the top of the script to have the script run in a clean predictable ZSH environemnt
#  Can use the -o argument to provide additional options your script needs on top of the clean baseline
#
emulate -L zsh

# 
# \e[		start of ANSI escape sequence
# 41		red backgrounid
# 1		bold text
# 37		white forground
# ;             separator between codes
# m             end the sequence
#
# \u27i18	The heavy x characterp
# \e[0m		resets all formatting back to normal ( no more red text and bold)
FAIL=$'\e[41;1;37m \u2718 \e[0m'
SUCCESS=$'\e[42;1;37m \u2705 \e[0m'

show_help() {
	print "Usage: nvidia__present [ must have either --card or --software --help ] --help --display "
	print ""
	print "To verify that the nvidia hardware and nvidia software are present"
	print ""
	print "Options:"
	print " -d, --display      Allows printing to the screen whether the nvidia card is present or not."
	print " -h, --help         print the options for the command"
	print " -c, --card         Determines if the computer has an NVIDIA gpu"
	print " -s, --software     Determines if the computer has the NVIDIA software to communicate with the driver"
	exit -1
}

verify_hardware() {
       
    if lspci | grep -i nvidia | grep -iq vga ; then
        [[ -n $opt_display ]] && echo "$SUCCESS NVIDIA hardware found"
        exit_status=0
    else
        [[ -n $opt_display ]] && echo "$FAIL NVIDIA hardware not found"
        exit_status=1
    fi
	
    return $exit_status 
} 

verify_software() {
    if which nvidia-smi 1>/dev/null; then
	   [[ -n $opt_display ]] && echo "$SUCCESS NVIDIA software found"
    else
	   [[ -n $opt_display ]] && echo "$FAIL NVIDIA software not found"
    fi
}
				
zparseopts -D -F \
	d=opt_display				-display=opt_display \
	h=showHelp					-help=showHelp \
	c=opt_verifyHardware    	-card=opt_verifyHardware \
    s=opt_verifySoftware    -software=opt_verifySoftware
if (( $? != 0 )); then
   exit 2
fi

if [[ -n $showHelp ]]; then
	show_help
fi

if [[ -n $opt_verifyHardware ]]; then
    verify_hardware
    verify_hardware_status_code=$?
fi

if [[ -n $opt_verifySoftware ]]; then
    verify_software
    verify_software_status_code=$?
fi

exit $(( $verify_hardware_status_code | $verify_software_status_code ))
