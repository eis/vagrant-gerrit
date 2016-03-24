# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# Plugin installation procedure from http://stackoverflow.com/a/28801317
required_plugins = %w(vagrant-omnibus vagrant-proxyconf)

plugins_to_install = required_plugins.select { |plugin| not Vagrant.has_plugin? plugin }
if not plugins_to_install.empty?
  puts "Installing plugins: #{plugins_to_install.join(' ')}"
  if system "vagrant plugin install #{plugins_to_install.join(' ')}"
    exec "vagrant #{ARGV.join(' ')}"
  else
    abort "Installation of one or more plugins has failed. Aborting."
  end
end

gerrit_war = 'gerrit-2.12.2.war'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "vStone/centos-6.x-puppet.3.x"
  config.omnibus.chef_version = '12.8.1'

  config.proxy.http     = ENV["http_proxy"]
  config.proxy.https    = ENV["https_proxy"]
  config.proxy.no_proxy = "localhost,127.0.0.1"

  config.vm.provision :shell, :privileged => true, :inline => "yum install java-1.7.0-openjdk -y"
  config.vm.provision :shell, :privileged => true, :inline => "service iptables stop"

  config.vm.provision "chef_solo" do |chef|
    chef.json = {
      :jenkins => {
        :master => {
          :port => 8081
        }
      }
    }
    chef.add_recipe "jenkins::master"
  end

  config.vm.provision :shell, :privileged => false,
    :inline => "wget -q --no-check-certificate"+
	" https://www.gerritcodereview.com/download/#{gerrit_war}"+
        " -O /vagrant/#{gerrit_war} && chmod 777 /vagrant/#{gerrit_war}"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path = "modules"
    puppet.manifest_file  = "site.pp"
  end

  #config.vm.provision :shell, :inline => "rm /vagrant/#{gerrit_war}"
  config.vm.network :forwarded_port, guest: 8080, host: 8091 # gerrit web
  config.vm.network :forwarded_port, guest: 8081, host: 8092 # jenkins
  config.vm.network :forwarded_port, guest: 29418, host: 29419 # gerrit ssh 

end
