#!/bin/bash

# install "Improved Nano Syntax Highlighting Files" from
# https://github.com/scopatz/nanorc
curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh

cat .bash_aliases >> ~/.bash_aliases
cat .bashrc >> ~/.bashrc

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
