#
# Cookbook Name:: fidor_mongodb
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "mongodb"

service "mongodb" do
end

template "/etc/mongodb.conf" do
  owner "root"
  group "root"
  mode "644" 
  source "mongodb.conf.erb"
  variables(
    :bind_ip => "0.0.0.0"
  )
  notifies :restart, "service[mongodb]"
end
