# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/bionic64"
  config.ssh.insert_key = false
  config.vm.hostname = 'data-science'

  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 8888, host: 8888
  config.vm.network :forwarded_port, guest: 6006, host: 6006

  config.vm.synced_folder "shared/", "/home/vagrant/shared"
  
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "8024"
    vb.cpus = 4
  end
  
  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true

end
