#!/bin/bash

echo "Updating system..."
sudo apt update && sudo apt upgrade -y

echo "Installing nginx..."
sudo apt install nginx -y

echo "All done!"
