# Dependencies
default['rails-machine']['packages'] = %w{
  vim git screen tmux bash-completion python-software-properties
  nodejs mongodb mongodb-clients
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

# RVM and gem settings
default['rails-machine']['rvm']['installer_url'] = "https://get.rvm.io"
default['rails-machine']['rvm']['branch']  = "stable"
default['rails-machine']['rvm']['ruby'] = '2.1.1'
default['rails-machine']['rvm']['packages'] = %w{
  build-essential openssl libreadline6 libreadline6-dev curl git-core
  zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3
  libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool
  bison ssl-cert subversion pkg-config libgdbm-dev libffi-dev
  libcurl4-openssl-dev gawk
}
default['rails-machine']['rvm']['clean_sources'] = true
default['rails-machine']['gem_options'] = 'gem: --no-rdoc --no-ri -V'
