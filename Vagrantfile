VAGRANTFILE_API_VERSION = "2"

Vagrant.configure VAGRANTFILE_API_VERSION do |config|
  config.vm.box = "ancor-raring64"
  config.vm.box_url = "https://ianunruh.s3.amazonaws.com/vagrant/ancor-raring64.box"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  config.vm.provision :puppet do |puppet|
    puppet.module_path = "puppet/modules"
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "site.pp"
    puppet.options = "--verbose --hiera_config /vagrant/hiera.yaml"
  end

  config.vm.define :houston do |sc|
    sc.vm.hostname = "houston.vboxlocal"
    sc.vm.network :private_network, ip: "192.168.56.10"
  end

  config.vm.define :toledo do |sc|
    sc.vm.hostname = "toledo.vboxlocal"
    sc.vm.network :private_network, ip: "192.168.56.11"
  end

  config.vm.define :irvine do |sc|
    sc.vm.hostname = "irvine.vboxlocal"
    sc.vm.network :private_network, ip: "192.168.56.12"
  end

  config.vm.define :aurora do |sc|
    sc.vm.hostname = "aurora.vboxlocal"
    sc.vm.network :private_network, ip: "192.168.56.13"
  end
end
