node default {
  include ntp
  include tree
  include docker

  class { 'google_chrome':
    version => 'stable',
  }

  class { '::vim': }
  vim::bundle { 'justin': }

  file { '/home/justin/plex':
    ensure => 'directory',
  }

  file { '/home/justin/keys':
    ensure => 'directory',
  }

  file { '/home/justin/infra':
    ensure => 'directory',
  }

  package {[ 'git', 'wget', 'htop', 'x2goclient', 'openvpn', 'net-tools', 'tlp' ]:
    ensure => 'installed',
  }
}
