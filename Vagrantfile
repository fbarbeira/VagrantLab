# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "trusty" do |trusty|
    trusty.vm.box = "trusty64"
    trusty.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
    trusty.vm.hostname = "va-trusty.puppet.lan"
    trusty.vm.provider "virtualbox" do |v|
      v.name = "Ubuntu 14 LTS x64 (vagrant)"
    end
  end

  config.vm.define "precise" do |precise|
    precise.vm.box = "precise64"
    precise.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
    precise.vm.hostname = "va-precise.puppet.lan"
    precise.vm.provider "virtualbox" do |v|
      v.name = "Ubuntu 12 LTS x64 (vagrant)"
    end
  end

  config.vm.define "lucid" do |lucid|
    lucid.vm.box = "lucid64"
    lucid.vm.box_url = "http://files.vagrantup.com/lucid64.box"
    lucid.vm.hostname = "va-lucid.puppet.lan"
    lucid.vm.provider "virtualbox" do |v|
      v.name = "Ubuntu 10 LTS x64 (vagrant)"
    end
  end

  config.vm.define "packager" do |packager|
    packager.vm.box = "precise64"
    packager.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
    packager.vm.hostname = "packager.puppet.lan"
    packager.vm.provider "virtualbox" do |v|
      v.name = "Packager (vagrant)"
      v.memory = 512
    end
  end

  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.hiera_config_path = "puppet/hiera.yaml"
    puppet.manifest_file = "site.pp"
    puppet.facter = { "is_vagrant" => true }
    puppet.options = "--verbose --debug"
  end
end
