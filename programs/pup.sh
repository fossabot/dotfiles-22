#!/bin/bash
set -ex

pup=0.4.0

sudo apt install -y unzip
wget "https://github.com/ericchiang/pup/releases/download/v$pup/pup_v${pup}_linux_amd64.zip"
unzip "pup_v${pup}_linux_amd64.zip"
rm "pup_v${pup}_linux_amd64.zip"
mv pup "$HOME/.local/bin/"
