#
# Cookbook Name:: fidor_postgres
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#

include_recipe "postgresql"

service "postgres" do
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
