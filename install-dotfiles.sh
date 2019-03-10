#!/bin/bash

# install "Improved Nano Syntax Highlighting Files" from
# https://github.com/scopatz/nanorc
curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh

cat .bash_aliases >> ~/.bash_aliases
cat .bashrc >> ~/.bashrc
