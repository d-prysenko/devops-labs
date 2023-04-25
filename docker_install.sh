#!/bin/bash

sudo pacman -Syu docker docker-compose
sudo systemctl start docker
sudo systemctl enable docker

sudo groupadd docker
sudo usermod -aG docker $USER

newgrp docker # or logout-login