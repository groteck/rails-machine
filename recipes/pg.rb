node['rails-machine']['pg']['packages'].each do |pkg|
  package pkg
end

execute "Add vagrant user to pg" do
  command "sudo -u postgres createuser vagrant -s"
end
