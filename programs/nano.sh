#!/bin/bash
set -ex

nano=4.2

sudo apt install -y libncursesw5-dev
mkdir -p "$HOME/src" && cd "$HOME/src/"
wget "https://www.nano-editor.org/dist/v4/nano-$nano.tar.xz"
tar xf "nano-$nano.tar.xz"
rm -r "nano-$nano.tar.xz"
cd "nano-$nano"
./configure --prefix="$HOME/.local/"
make
make install
cd "$HOME"
