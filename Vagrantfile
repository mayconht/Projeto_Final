# -*- mode: ruby -*-
# vi: set ft=ruby :
#Esse codigo vai criar as duas vms com configuracao basica do vagrant

Vagrant.configure("2") do |config|
  config.vm.define "VM1" do |vm1|
  config.vm.provision "shell", path: "https://raw.githubusercontent.com/mayconht/Projeto_Final/master/configVM1a.sh"
  config.vm.provision :reload
  config.vm.provision "shell", path: "https://raw.githubusercontent.com/mayconht/Projeto_Final/master/configVM1b.sh"
    vm1.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = "1"
    end
    vm1.vm.box = "ubuntu/bionic64"
    vm1.vm.hostname = "VM1"
    vm1.vm.network "public_network", bridge: "eno1"
    vm1.vm.network "private_network", ip: "192.168.2.100"
  end

  config.vm.define "VM2" do |vm2|
  config.vm.provision "shell", path: "https://raw.githubusercontent.com/mayconht/Projeto_Final/master/configVM2a.sh"
  config.vm.provision :reload
  config.vm.provision "shell", path: "https://raw.githubusercontent.com/mayconht/Projeto_Final/master/configVM2b.sh"
    vm2.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = "1"
    end
    vm2.vm.box = "ubuntu/bionic64"
    vm2.vm.hostname = "VM2"
    vm2.vm.network "public_network", bridge: "eno1"
    vm2.vm.network "private_network", ip: "192.168.2.101"
  end
end