# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.define "trusty" do |trusty|
    trusty.vm.box = "ubuntu/trusty64"
    trusty.vm.hostname = "va-trusty.puppet.lan"
    trusty.vm.provider "virtualbox" do |v|
      v.name = "Ubuntu 14 LTS x64 (vagrant)"
    end
  end

  config.vm.define "precise" do |precise|
    precise.vm.box = "ubuntu/precise64"
    precise.vm.hostname = "va-precise.puppet.lan"
    precise.vm.provider "virtualbox" do |v|
      v.name = "Ubuntu 12 LTS x64 (vagrant)"
    end
  end

  config.vm.define "jessie" do |jessie|
    jessie.vm.box = "debian/jessie64"
    jessie.vm.hostname = "va-jessie.puppet.lan"
    jessie.vm.provider "virtualbox" do |v|
      v.name = "Debian 8 x64 (vagrant)"
    end
  end

  #config.vm.network :forwarded_port, guest: 80, host: 8080, id: "web"
  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.hiera_config_path = "puppet/hiera.yaml"
    puppet.options = "--verbose --environment develop"
    puppet.facter = {
	   "is_vagrant" => true,
    }
  end
end
