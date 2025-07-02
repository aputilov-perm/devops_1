#!/bin/bash 
echo 'Updating repo' apt update
echo 'Removing unuse packages' 
apt autoremove - y
echo 'Installing basic software'
packages='mc htop iotop net- tools jq'
for package in $package
do 
  echo 'Installing' $package
  apt install $package - y done
echo 'All packages have been installed'
