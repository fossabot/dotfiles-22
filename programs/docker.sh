#!/bin/bash
set -ex

sudo curl -sSL https://get.docker.com | sh
sudo groupadd docker
sudo usermod -aG docker "$USER"
sudo apt install python3-pip
sudo pip3 install -U docker-compose
