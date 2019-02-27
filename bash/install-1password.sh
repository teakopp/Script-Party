#!/bin/bash

# Installs 1password
if [ -e /Applications/1Password\ 6.app	]
then
  echo "1Password 6 is already installed"
else
  cd /
  curl -O https://c.1password.com/dist/1P/mac4/1Password-6.8.9.pkg

  if [ -e 1Password-6.8.9.pkg ]
  then
      installer -pkg 1Password-6.8.9.pkg -target .
      rm 1Password-6.8.9.pkg
      echo "Success : 1Password-6.8.9 installed"
  else
      echo "Failed : 1Password-6.8.9 was not installed"
  fi
fi
