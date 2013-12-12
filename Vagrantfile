# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "precise" do |precise|
    precise.vm.box = "precise64"
    precise.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
    precise.vm.hostname = "va-precise.puppet.lan"
    precise.vm.provider :virtualbox do |v|
      v.name = "Ubuntu 12 LTS x64 (vagrant)"
    end
  end

  config.vm.define "lucid" do |lucid|
    lucid.vm.box = "lucid64"
    lucid.vm.box_url = "http://files.vagrantup.com/lucid64.box"
    lucid.vm.hostname = "va-lucid.puppet.lan"
    config.vm.provider "virtualbox" do |v|
      v.name = "Ubuntu 10 LTS x64 (vagrant)"
    end
  end

  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "site.pp"
    puppet.module_path = "puppet/modules"
    puppet.options = "--verbose"
  end
end
