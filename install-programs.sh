#!/bin/bash
set -ex

# install all my default programs I like to use

# docker
sudo curl -sSL https://get.docker.com | sh
sudo groupadd docker
sudo usermod -aG docker "${USER}"
sudo apt install python3-pip
sudo pip3 install -U docker-compose

# cron
# expand path
(crontab -l 2>/dev/null; echo -e "SHELL=/bin/bash\nPATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin")| crontab -
(sudo crontab -l 2>/dev/null; echo -e "SHELL=/bin/bash\nPATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin")| sudo crontab -

# packages for ddclient
sudo apt install ddclient perl libdata-validate-ip-perl libjson-any-perl
mkdir -p "${HOME}"/src
cd "${HOME}"/src
git clone https://github.com/ddclient/ddclient.git
sudo cp ddclient /usr/sbin/
sudo mkdir -p /etc/ddclient/

# nano 4
nano=4.0

sudo apt install libncursesw5-dev
mkdir -p "${HOME}"/src && cd "${HOME}"/src/
wget https://www.nano-editor.org/dist/v4/nano-${nano}.tar.xz
tar xf nano-${nano}.tar.xz
rm -r nano-${nano}.tar.xz
cd nano-${nano}
./configure --prefix="${HOME}"/.local/
make
make install
cd "${HOME}"

# gotop
git clone --depth 1 https://github.com/cjbassi/gotop /tmp/gotop
/tmp/gotop/scripts/download.sh
rm /tmp/gotop/scripts/download.sh
mv gotop "${HOME}"/.local/bin/

# mcfly
mcfly=0.3.3
wget https://github.com/cantino/mcfly/releases/download/v${mcfly}/mcfly-v${mcfly}-x86_64-unknown-linux-gnu.tar.gz
tar xf mcfly-v${mcfly}-x86_64-unknown-linux-gnu.tar.gz
rm mcfly-v${mcfly}-x86_64-unknown-linux-gnu.tar.gz
mv mcfly "${HOME}"/.local/bin/
mv mcfly.bash "${HOME}"/.local/
tee -a "${HOME}"/.bashrc <<EOF

if [[ -r "${HOME}"/.local/mcfly.bash ]]; then
  source "${HOME}"/.local/mcfly.bash
fi
EOF

# latest rclone
curl https://rclone.org/install.sh | sudo bash

# rvm
gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | sudo bash -s stable
sudo usermod -aG rvm "${USER}"
sudo usermod -aG rvm root

# random utils
sudo apt install mailutils tree unzip zip

# reload local bin folder and terminal
source "${HOME}"/.profile
source "${HOME}"/.bashrc
