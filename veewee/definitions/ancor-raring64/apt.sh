apt-get -y update
apt-get -y upgrade
apt-get -y install linux-headers-$(uname -r) build-essential dkms
apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev libyaml-dev
apt-get -y install vim htop screen
apt-get -y install nfs-common
