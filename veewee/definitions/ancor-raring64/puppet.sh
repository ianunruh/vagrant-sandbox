RELEASE_FILE=puppetlabs-release-raring.deb

wget http://apt.puppetlabs.com/$RELEASE_FILE
dpkg -i $RELEASE_FILE
rm $RELEASE_FILE

apt-get update
apt-get install puppet -y
