# Dependencies
default['rails-machine']['packages'] = %w{
  vim git screen tmux bash-completion python-software-properties
  nodejs
}

default['rails-machine']['ruby'] = '2.1'
default['rails-machine']['gem-optionms'] = 'gem: --no-rdoc --no-ri -V'
