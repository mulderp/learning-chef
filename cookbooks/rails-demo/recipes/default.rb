#
# Cookbook Name:: rails-demo
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
directory "/var/www/rails-apps/rails-demo/shared/config" do
  owner "vagrant"
  group "vagrant"
  recursive true
end

template "/var/www/rails-apps/rails-demo/shared/config/mongoid.yml" do
  owner "vagrant"
  group "vagrant"
  variables(
    :mongodb_host => "192.168.1.20"
  )
end

application "rails-demo" do
  path "/var/www/rails-apps/rails-demo"
  owner "vagrant"
  group "vagrant"
  repository "http://github.com/mulderp/chef-demo.git"
  rails do 
    bundler true
  end
  symlinks "config/mongoid.yml" => "config/mongoid.yml"  
  passenger_apache2
end


