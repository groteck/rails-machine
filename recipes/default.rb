#
# Cookbook Name:: rails-machine
# Recipe:: default
include_recipe 'apt'

node['rails-machine']['packages'].each do |pkg|
  package pkg
end

if node['rails-machine']['db'] == 'mongo'
  node['rails-machine']['mongo']['packages'].each do |pkg|
    package pkg
  end
else
  include_recipe 'rails-machine::pg'
end

include_recipe 'rails-machine::rvm'
include_recipe 'phantomjs::default'
