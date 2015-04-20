# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX_NAME = ENV["SALTLAB"] || "saltlab"
SALT_REPO = ENV["SALT_REPO"] || nil

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |vb|
    vb.name = BOX_NAME
    vb.customize ["modifyvm", :id, "--memory", 2048]
  end

  config.vm.network "private_network", type: "dhcp"
  config.ssh.forward_agent = true
  if SALT_REPO
    config.vm.synced_folder SALT_REPO, "/home/vagrant/salt/"
  end

  # speed up provisioning by enabling caching
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  config.vm.synced_folder "salt/roots/", "/srv/"
  config.vm.provision :salt do |salt|
    salt.install_type = "git"
    salt.install_args = "v2015.2.0rc2"
    salt.minion_config = "salt/minion"
    salt.run_highstate = true
    salt.verbose = true
    salt.colorize = true
  end

end
