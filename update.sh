#!/bin/bash

if [ -d /etc/apt ]
then
    # It's a debian based distro.
    source set-nala.sh
    sudo $INSTALLER update && sudo $INSTALLER upgrade -y
fi

if [ -d /etc/pacman.d ]
then
    # It's an Arch based distro.
    export INSTALLER="pacman"
    sudo $INSTALLER -Syu
fi

if [ -d /etc/dnf ]
then
    # It's fedora/RHEL based distro
    export INSTALLER="dnf"
    sudo $INSTALLER update -y
fi