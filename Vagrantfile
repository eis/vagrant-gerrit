# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "vStone/centos-6.x-puppet.3.x"
  config.vm.provision :shell, :privileged => false, :inline => "wget -q --no-check-certificate https://www.gerritcodereview.com/download/gerrit-2.8.1.war -O /vagrant/gerrit-2.8.1.war && chmod 777 /vagrant/gerrit-2.8.1.war"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path = "modules"
    puppet.manifest_file  = "site.pp"
  end
  config.vm.provision :shell, :inline => "rm /vagrant/gerrit-2.8.1.war"
  config.vm.network :forwarded_port, guest: 8080, host: 8081
  config.vm.network :forwarded_port, guest: 29418, host: 29418
end
