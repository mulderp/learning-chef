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

directory "/etc/postgres/9.1/main" do
  owner 'root'
  group 'root'
  recursive true
end

service "postgresql" do
end

template "/etc/postgres/9.1/main/postgres.conf" do
  owner "root"
  group "root"
  mode "644" 
  source "postgres.conf.erb"
  variables(
    :bind_ip => "0.0.0.0"
  )
  notifies :restart, "service[postgresql]"
end

#postgresql_database 'mr_softie' do
#  connection ({:host => "127.0.0.1", :port => 5432, :username => 'postgres', :password => node['postgresql']['password']['postgres']})
#  action :create
#end

#execute "create-root-user" do
#    code = <<-EOH
#    psql -U postgres -c "select * from pg_user where usename='root'" | grep -c root
#    EOH
#    command "createuser -U postgres -s root"
#    not_if code 
#end
# 
#execute "create-database-user" do
#    code = <<-EOH
#    psql -U postgres -c "select * from pg_user where usename='#{node[:dbuser]}'" | grep -c #{node[:dbuser]}
#    EOH
#    command "createuser -U postgres -sw #{node[:dbuser]}"
#    not_if code 
#end
# 
#execute "create-database" do
#    exists = <<-EOH
#    psql -U postgres -c "select * from pg_database WHERE datname='#{node[:dbname]}'" | grep -c #{node[:dbname]}
#    EOH
#    command "createdb -U postgres -O #{node[:dbuser]} -E utf8 -T template0 #{node[:dbname]}"
#    not_if exists
#end
#    
