#!/bin/bash

sudo usermod -aG docker $USER

sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo reboot