# -*- mode: ruby -*-
# vi: set ft=ruby :

var_box = "generic/rocky8"

Vagrant.configure("2") do |config|

  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = false
  end
  
  # Nodes
  (1..1).each do |i|
    config.vm.define "node#{i}" do |nodes|
      nodes.vm.box = var_box
      nodes.vm.hostname = "node#{i}"
      nodes.vm.network "public_network", ip: "192.168.0.21#{i}", bridge: "en6: Thunderbolt Ethernet Slot 1"
      nodes.vm.provision :hosts, :sync_hosts => true
      nodes.vm.network "forwarded_port", guest: 2200, host: 22
      
      nodes.vm.provider "virtualbox" do |v|
        v.memory = "1024"
        v.cpus = "2"
        v.name = "node#{i}"
      end
           
      nodes.vm.provision "shell", inline: <<-SHELL
        sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
        systemctl restart sshd
        systemctl stop firewalld
      SHELL
      
      end
  end
end
