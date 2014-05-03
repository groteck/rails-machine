node['rails-machine']['rvm']['packages'].each do |pkg|
  package pkg
end

execute "Install rvm" do
  command "curl -L #{node['rails-machine']['rvm']['installer_url']} | bash -s #{node['rails-machine']['rvm']['branch']}"
  user node['user_name']
  cwd  node['user_home']
  environment node['user_env']
  creates "#{node['user_home']}/.rvm/scripts/rvm"
end

bash "Install ruby #{node['rails-machine']['rvm']['ruby']}" do
  code "source $HOME/.rvm/scripts/rvm ; rvm install #{node['rails-machine']['rvm']['ruby']}"
  user node['user_name']
  cwd  node['user_home']
  environment node['user_env']
  creates "#{node['user_home']}/.rvm/rubies/#{node['rails-machine']['rvm']['ruby']}/config"
  subscribes :run, resources(:execute => "Install rvm")
end

if node['rails-machine']['rvm']['clean_sources']
  rvm_src_path = "#{node['user_home']}/.rvm/src"
  execute "remove rvm sources" do
    command "rm -fr #{rvm_src_path}/*"
    only_if { ::File.exists? "#{rvm_src_path}/rvm" }
    subscribes :run, resources(:bash => "Install ruby #{node['rails-machine']['rvm']['ruby']}")
  end
end

# Create a .gemrc for the aentos user
file "#{node['user_home']}/.gemrc" do
  content node['rails-machine']['gem_options']
  owner  node['user_name']
  group  node['user_name']
  mode   0644
  action :create_if_missing
end
