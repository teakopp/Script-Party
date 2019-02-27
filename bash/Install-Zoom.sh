#!/bin/bash

if [ -e /Applications/zoom.us.app ]
then
    echo  "Zoom is already installed"
else
  cd /
  curl -OL http://zoom.us/client/latest/zoomusInstaller.pkg

  if [ -e zoomusInstaller.pkg ]
  then
      installer -pkg zoomusInstaller.pkg -target .
      echo "Success : Zoom installed"
      rm zoomusInstaller.pkg
  else
      echo "Failed : Zoom was not installed"
  fi
fi
