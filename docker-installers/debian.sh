#!/bin/bash

# Update the apt package index and install packages to allow apt to use a repository over HTTPS:

sudo $INSTALLER install ca-certificates curl gnupg

# Add Docker’s official GPG key:

echo "Adding Docker GPG key"

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# set up the repository:

echo "Setting up the repository:"

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Updateing repository"

sudo $INSTALLER update

sudo $INSTALLER install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y


