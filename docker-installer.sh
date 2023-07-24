#!/bin/bash

release=/etc/os-release

if grep -q "Ubuntu" $release
then
    echo "It's Ubuntu based distro"
    source update.sh
fi

if grep -q "Debian" $release
then
    echo "It's Debian based distro"
    source update.sh
    source docker-installers/debian.sh
    source docker-installers/post-install.sh
fi

if grep -q "Fedora" $release || grep -q "Red Hat" $release || grep -q "CentOS" $release
then
    echo "It's Fedora/RHEL/CentOS based distro"
    source update.sh
    source docker-installers/fedora.sh
    source docker-installers/post-install.sh
fi

