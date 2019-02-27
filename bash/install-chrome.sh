#!/bin/bash
# installs Google Chrome
echo $USER
if [ -e /Applications/Google\ Chrome.app ]
then
	echo "Google Chrome is already installed"
else
  cd /
  curl -O https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg

  if [ -e googlechrome.dmg]
  then
      hdiutil attach googlechrome.dmg
      cp -R /Volumes/Google\ Chrome/Google\ Chrome.app ./Applications
      hdiutil detach /Volumes/Google\ Chrome
      rm googlechrome.dmg
      echo "Success : Google Chrome Installed"
  else
      echo "Failed : Google Chrome Was Not Installed"
  fi
fi
