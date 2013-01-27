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
include_recipe "postgresql::server"

service "postgres" do
end

#postgresql_database 'mr_softie' do
#  connection ({:host => "127.0.0.1", :port => 5432, :username => 'postgres', :password => node['postgresql']['password']['postgres']})
#  action :create
#end

#template "/etc/mongodb.conf" do
#  owner "root"
#  group "root"
#  mode "644" 
#  source "mongodb.conf.erb"
#  variables(
#    :bind_ip => "0.0.0.0"
#  )
#  notifies :restart, "service[mongodb]"
#end
