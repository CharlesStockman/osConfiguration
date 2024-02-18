#!/bin/sh

originalLine=`tail -n 1 /etc/slackpkg/mirrors`

# Remove the first character ( remove the # so slackware will know to use this mirror )
# The script is not runnable yet the original line and new line look correct, but the
# new line is not being replaced
newLine=`echo $originalLine | cut -c 2-` 

echo "1 \"$originalLine\""
echo "2 $newLine"

sed -i 's/$originalLine/$newLine/g' /etc/slackpkg/mirrors 
