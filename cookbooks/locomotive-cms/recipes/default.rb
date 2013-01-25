#
# Cookbook Name:: locomotivecms
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#

include_recipe "imagemagick"
include_recipe "imagemagick::rmagick"

directory "/var/www/rails-apps/locomotivecms/shared/config" do
  owner "vagrant"
  group "vagrant"
  recursive true
end

template "/var/www/rails-apps/locomotivecms/shared/config/mongoid.yml" do
  owner "vagrant"
  group "vagrant"
  variables(
    :mongodb_host => "192.168.1.20"
  )
end

application "locomotivecms" do
  path "/var/www/rails-apps/locomotivecms"
  owner "vagrant"
  group "vagrant"
  repository "http://github.com/mulderp/chef-locomotivecms.git"
  rails do 
    bundler true
  end
  symlinks "config/mongoid.yml" => "config/mongoid.yml"  
  passenger_apache2
end


