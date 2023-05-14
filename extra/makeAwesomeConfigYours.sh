# Purpose : to copy the Awesome Configuration Script ( rc.lua ) to your home directory

if [ ! -d ~/.config ]
then 
	mkdir ~/.config
fi

if [ ! -d ~/.config/awesome ]
then
	mkdir ~/.config/awesome
fi

if [ ! -e ~/.config/awesome/rc.lua ] 
then
	cp ~/git/linuxConfiguration/windowConfiguration/awesome/rc.lua ~/.config/awesome/rc.lua
fi
