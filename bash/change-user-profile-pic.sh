#!/bin/bash

# Gets current profile picture location, clears it, then imports new path to by creating and writing to import.txt. Path is currently set as octocat when I worte this.
# Then, an if statement will tell the user whether the command was successful and deletes import.txt
echo "0x0A 0x5C 0x3A 0x2C dsRecTypeStandard:Users 5 dsAttrTypeStandard:RecordName dsAttrTypeStandard:UniqueID dsAttrTypeStandard:PrimaryGroupID dsAttrTypeStandard:GeneratedUID externalbinary:dsAttrTypeStandard:JPEGPhoto" > import.txt
echo $USER:$UID:$(id -g):$(dscl . -read /Users/$USER GeneratedUID | cut -d' ' -f2):/Library/User \Pictures/Fun/Octocat.png >> import.txt
dscl . -delete /Users/$USER JPEGPhoto
dsimport import.txt /Local/Default M -u $USER
rm import.txt
if [ $? -eq 0 ]; then
    echo "Success : User profile picture was changed to Octocat"
else
    echo echo "Failed : User profile picture was not changed"
fi

# disables auto-login and if statement will tell the user whether the command was successful
echo "Enter password to disable auto-login"
sudo defaults delete /Library/Preferences/com.apple.loginwindow autoLoginUser
if [ $? -eq 0 ]; then
    echo "Success : Auto-login has been disabled"
else
    echo "Failed : Auto-login was not diabled"
fi

# prints out user login so that we can label computer correctly
echo ""
echo "This User is ${USER}"
echo ""
