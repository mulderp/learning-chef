#
# Cookbook Name:: fidor_rubies
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#

node.default['rbenv']['user_installs'] = [ 
  {'user' => 'vagrant',
   'rubies' => ["1.9.3-p0"],
   'global' => "1.9.3-p0",
   'gems' => {
      '1.9.3-p0' => [ { 
    'name'    => 'bundler', 
    'version' => '1.1.rc.5' } ]
  }
}

]

include_recipe "ruby_build"
include_recipe "rbenv::user"

#rbenv_global "1.9.3-p0"
