#!/bin/bash

echo "Checking if Nala is installed" 

if command -v nala
then
    echo "Nala already install, setting nala as primary installer"
    export INSTALLER="nala"
else
    echo "The nala is not installed on this computer"
    read -p "Do you want to install nala? (y/n): " VAR1
    if [ "$VAR1" = "y" ]
    then
        echo "Installing Nala"
        sudo apt update && sudo apt install nala
        export INSTALLER="nala"
    else
        echo "Setting apt as primary installer"
        export INSTALLER="apt"
    fi
fi