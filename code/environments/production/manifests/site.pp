node default {
  include ntp
  include tree
  include docker

  class { 'google_chrome':
    version => 'stable',
  }

  class { '::vim':
    opt_misc => ['hlsearch','showcmd','showmatch','ignorecase','smartcase','incsearch','autowrite','hidden','number'],
  }

  file { '/home/justin/plex':
    ensure => 'directory',
  }

  file { '/home/justin/keys':
    ensure => 'directory',
  }

  file { '/home/justin/infra':
    ensure => 'directory',
  }

  archive { '/tmp/hyper_3.0.2_amd64.deb':
    source => 'https://releases.hyper.is/download/deb',
    ensure => 'present',
    user   => 'justin',
    group  => 'justin',
    creates => '/tmp/hyper_3.0.2_amd64.deb',
  }
  
  package { 'hyper':
    ensure   => 'installed',
    provider => 'dpkg',
    source   => '/tmp/hyper_3.0.2_amd64.deb',
  }
  
  package {[ 'git', 'wget', 'htop', 'x2goclient' ]:
    ensure => 'installed',
  }
}
