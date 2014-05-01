#
# Cookbook Name:: rails-machine
# Recipe:: default
include_recipe 'apt'

node['rails-machine']['packages'].each do |pkg|
  package pkg
end

