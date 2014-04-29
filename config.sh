git config --global user.name “avalonhse”
git config --global user.email avalonhse@gmail.com

mkdir ~/Downloads
cd ~/Downloads
wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
sudo dpkg -i puppetlabs-release-precise.deb 
sudo apt-get -y install puppet 
sudo chown -R ubuntu:ubuntu /etc/puppet

echo $'#!/bin/sh\nsudo puppet apply /home/ubuntu/EC2/puppet/manifests/site.pp --modulepath=/home/ubuntu/EC2/puppet/modules/  $*'  | sudo tee /usr/local/bin/papply > /dev/null
sudo chmod a+x /usr/local/bin/papply

cd ~/EC2
cp id_rsa /home/ubuntu/.ssh/
sudo chmod 400 /home/ubuntu/.ssh/id_rsa
