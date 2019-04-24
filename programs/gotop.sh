#!/bin/bash
set -ex

git clone --depth 1 https://github.com/cjbassi/gotop /tmp/gotop
/tmp/gotop/scripts/download.sh
rm /tmp/gotop/scripts/download.sh
mv gotop "$HOME/.local/bin/"
