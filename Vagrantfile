# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.define :web do |web_config|
    web_config.vm.box = "web"
    web_config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_chef-10.18.2.box"
    web_config.vm.network :hostonly, "192.168.1.10"
    web_config.vm.forward_port 80, 8080

    web_config.vm.provision :chef_client do |chef|
      chef.chef_server_url = "https://api.opscode.com/organizations/fidor"
      chef.validation_key_path = "./.chef/fidor-validator.pem"
      chef.validation_client_name = "fidor-validator"
      chef.node_name = "patrick_web_vm_1"
      chef.add_role "base"
      chef.add_role "application"
    end
  end

  config.vm.define :mongo do |mongo_config|
    mongo_config.vm.box = "mongo"
    mongo_config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_chef-10.18.2.box"
    mongo_config.vm.network :hostonly, "192.168.1.20"
    mongo_config.vm.forward_port 27017, 27018

    mongo_config.vm.provision :chef_client do |chef|
      chef.chef_server_url = "https://api.opscode.com/organizations/fidor"
      chef.validation_key_path = "./.chef/fidor-validator.pem"
      chef.validation_client_name = "fidor-validator"
      chef.node_name = "patrick_mongo_vm_1"
      chef.add_role "base"
      chef.add_role "mongodb"
    end
  end
end
