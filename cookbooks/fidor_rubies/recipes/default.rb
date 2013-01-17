#
# Cookbook Name:: fidor_rubies
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#

node.default['rbenv']['rubies'] = [ "1.9.3-p0" ]

include_recipe "rbenv::system"
include_recipe "ruby_build"

rbenv_global "1.9.3-p0"

node.default['rbenv']['gems'] = {
  '1.9.3-p0' => [ { 
    'name'    => 'bundler', 
    'version' => '1.1.rc.5' } ]
}

