#!/bin/bash
set -ex

mcfly=0.3.3
wget "https://github.com/cantino/mcfly/releases/download/v$mcfly/mcfly-v${mcfly}-x86_64-unknown-linux-gnu.tar.gz"
tar xf "mcfly-v$mcfly-x86_64-unknown-linux-gnu.tar.gz"
rm "mcfly-v$mcfly-x86_64-unknown-linux-gnu.tar.gz"
mv mcfly "$HOME/.local/bin/"
mv mcfly.bash "$HOME/.local/"
tee -a "$HOME/.bashrc" <<EOF

if [[ -r "$HOME/.local/mcfly.bash" ]]; then
  source "$HOME/.local/mcfly.bash"
fi"
EOF
