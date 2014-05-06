VAGRANTFILE_API_VERSION = "2"

Vagrant.configure VAGRANTFILE_API_VERSION do |config|
  config.vm.box = "ancor-raring64"
  config.vm.box_url = "https://ianunruh.s3.amazonaws.com/vagrant/ancor-raring64.box"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "768"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on", "--natdnshostresolver1", "on"]
  end

  config.vm.provision :puppet do |puppet|
    puppet.module_path = "puppet/modules"
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "site.pp"
    puppet.options = [
      "--verbose",
      "--hiera_config", "/vagrant/hiera.yaml",
      "--templatedir",  "/vagrant/puppet/templates"
    ]
  end

  boxes = {
    houston: "192.168.56.10",
    toledo: "192.168.56.11",
    irvine: "192.168.56.12",
    aurora: "192.168.56.13",
    spokane: "192.168.56.14",
    newark: "192.168.56.15",
  }

  boxes.each do |name, ip|
    config.vm.define name do |box|
      box.vm.hostname = "#{name}.vboxlocal"
      box.vm.network :private_network, ip: ip
    end
  end
end
