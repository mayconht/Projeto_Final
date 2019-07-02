# -*- mode: ruby -*-
# vi: set ft=ruby :
#Esse codigo vai criar as duas vms com configuracao basica do vagrant

Vagrant.configure("2") do |config|
  config.vm.define "VM1" do |vm1|
    vm1.vm.provision "shell", path: "https://raw.githubusercontent.com/mayconht/Projeto_Final/master/configVM1a.sh"
    vm1.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = "1"
    end
    vm1.vm.box = "ubuntu/bionic64"
    vm1.vm.hostname = "VM1"
    vm1.vm.network "private_network", ip: "192.168.2.100"

    vm1.vm.network "forwarded_port",
      guest: 5000, host: 5000
	
    vm1.vm.network "forwarded_port",
      guest: 5001, host: 5001

    vm1.vm.network "forwarded_port",
      guest: 9000, host: 9000

    vm1.vm.network "forwarded_port",
      guest: 9100, host: 9100

    vm1.vm.network "forwarded_port",
      guest: 8080, host: 8081

    vm1.vm.network "forwarded_port",
      guest: 6379, host: 6380
  end

  config.vm.define "VM2" do |vm2|

    vm2.vm.provision "shell", path: "https://raw.githubusercontent.com/mayconht/Projeto_Final/master/configVM2a.sh"
    vm2.vm.provision "shell", path: "https://raw.githubusercontent.com/mayconht/Projeto_Final/master/configVM2b.sh"
    vm2.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = "1"
    end
    vm2.vm.box = "ubuntu/bionic64"
    vm2.vm.hostname = "VM2"
    vm2.vm.network "private_network", ip: "192.168.2.101"
    
    vm2.vm.network "forwarded_port",
      guest: 5000, host: 5500
	
    vm2.vm.network "forwarded_port",
      guest: 5001, host: 5501

    vm2.vm.network "forwarded_port",
      guest: 9000, host: 9900

    vm2.vm.network "forwarded_port",
      guest: 9100, host: 9200

    vm2.vm.network "forwarded_port",
      guest: 9090, host: 9990

    vm2.vm.network "forwarded_port",
      guest: 3000, host: 3000

    vm2.vm.network "forwarded_port",
      guest: 8080, host: 8080

    vm2.vm.network "forwarded_port",
      guest: 6379, host: 6379
  end
end