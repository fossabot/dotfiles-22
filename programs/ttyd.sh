#!/bin/bash
set -ex

sudo apt install -y cmake libjson-c-dev libwebsockets-dev
cd "$HOME/src/"
git clone https://github.com/tsl0922/ttyd.git
mkdir ttyd/build && cd ttyd/build
cmake ..
make && sudo make install
