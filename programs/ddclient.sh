#!/bin/bash
set -ex

sudo apt install -y ddclient perl libdata-validate-ip-perl libjson-any-perl
mkdir -p "$HOME"/src
cd "$HOME"/src
git clone https://github.com/ddclient/ddclient.git
sudo cp ddclient /usr/sbin/
sudo mkdir -p /etc/ddclient/
