#
# The purpose of this script is to set the global environemnt variable ZDOTDIR
#
# Zsh needs to know the directory where start up files are located ( .zshenv and .zshenv)
# which is ZDODRIR. 
#

cat > /Library/LaunchDaemons/setenv.ZDOTDIR.plist << "END"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
  <plist version="1.0">
  <dict>
  <key>Label</key>
  <string>setenv.ZDOTDIR</string>
  <key>ProgramArguments</key>
  <array>
    <string>/bin/launchctl</string>
    <string>setenv</string>
    <string>ZDOTDIR</string>
    <string>/Users/charlesstockman/git/linuxConfiguration/dotfiles/zsh</string>
  </array>
  <key>RunAtLoad</key>
  <true/>
  <key>ServiceIPC</key>
  <false/>
</dict>
</plist>
END

#
# Set the environmental variable
#
launchctl setenv ZDOTDIR /Users/charlesstockman/git/linuxConfiguration/dotfiles/zsh
