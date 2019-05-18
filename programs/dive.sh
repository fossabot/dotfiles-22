#!/bin/bash
dive=0.7.2

wget https://github.com/wagoodman/dive/releases/download/v$dive/dive_"$dive"_linux_amd64.deb
sudo apt install ./dive_"$dive"_linux_amd64.deb
rm dive_"$dive"_linux_amd64.deb
