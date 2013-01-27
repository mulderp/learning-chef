# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.define :pg do |pg_config|
    pg_config.vm.box = "pg"
    pg_config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/boxes/opscode-ubuntu-12.04.box"
    pg_config.vm.network :hostonly, "192.168.1.20"
    pg_config.vm.forward_port 5432, 5432

    pg_config.vm.provision :chef_client do |chef|
      chef.chef_server_url = "https://api.opscode.com/organizations/fidor"
      chef.validation_key_path = "./.chef/fidor-validator.pem"
      chef.validation_client_name = "fidor-validator"
      chef.node_name = "patrick_pg_vm_1"
      chef.add_role "base"
      chef.add_recipe "fidor_postgres"
    end
  end
end
