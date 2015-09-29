# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

gerrit_war = 'gerrit-2.8.1.war'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "vStone/centos-6.x-puppet.3.x"
  config.vm.provision :shell, :privileged => false,
    :inline => "wget -q --no-check-certificate"+
	" https://www.gerritcodereview.com/download/#{gerrit_war}"+
        " -O /vagrant/#{gerrit_war} && chmod 777 /vagrant/#{gerrit_war}"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path = "modules"
    puppet.manifest_file  = "site.pp"
  end
  config.vm.provision :shell, :inline => "rm /vagrant/#{gerrit_war}"
  config.vm.network :forwarded_port, guest: 8080, host: 8081
  config.vm.network :forwarded_port, guest: 29418, host: 29418
end
