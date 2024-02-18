#
# Purpose : To block the kernel from being updated
# This is area of many issues when upgrading slackware
# 
sed -i 's/#kernel/kernel/g' /etc/slackpkg/blacklist
