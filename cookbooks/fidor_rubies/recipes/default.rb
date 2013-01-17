#
# Cookbook Name:: fidor_rubies
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#

include_recipe "chef-ruby_build"
include_recipe "chef-rbenv"

ruby_build_ruby :default do
  definition "1.9.3-p362"
  prefix_path "/usr/local/ruby/ruby-1.9.3-p362"

  action :install
end

rbenv_global "1.9.3-p362"
