name             'rails-machine'
maintainer       'Juan Gabriel Fraire López'
maintainer_email 'groteck@gmail.com'
license          'WTFPL'
description      'Installs/Configures rails-machine'
long_description 'README.md'
version          '0.1.0'

recipe "rails-machine", "Setup your rails machine"
depends "rvm"
depends "apt"
depends "phantomjs"
