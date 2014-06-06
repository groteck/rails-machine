# Dependencies
default['rails-machine']['packages'] = %w{
  vim git screen tmux bash-completion python-software-properties
  nodejs mongodb mongodb-clients
}

# Pg dependencies
default['rails-machine']['pg']['packages'] = %w{
  postgresql-common postgresql libpq-dev
}

# Mongo dependencies
default['rails-machine']['mongo']['packages'] = %w{
  mongodb mongodb-clients
}


# User info
default['rails-machine']['user'] = 'vagrant'

# Set some handy vars
default['user_name'] = node['rails-machine']['user']
default['user_home'] = "/home/#{node['user_name']}"
default['user_env'] = {
  'USER' => node['user_name'],
  'HOME' => node['user_home']
}

# Set default database
default['rails-machine']['db'] == 'mongo'

# RVM and gem settings
default['rails-machine']['rvm']['ruby'] = '2.1.2'

default['rvm']['user_installs'] = [
  { 'user'          => node['rails-machine']['user'],
    'default_ruby'  => node['rails-machine']['rvm']['ruby'],
    'rubies'        => [node['rails-machine']['rvm']['ruby']]
  }
]
