#!/bin/bash

echo "----- Updating system -----"
sudo apt update && sudo apt upgrade -y

echo "----- Installing openSSH -----"
sudo apt install -y openssh-server

echo "----- Installing git -----"
sudo apt install -y git

echo "----- All done! -----"
