node default {
  include ntp
  include tree
  include docker
  include software::browsers::chrome
  include social::slack
  include storage::filezilla
  include vcsscm::git

  class { '::vim':
    opt_misc => ['hlsearch','showcmd','showmatch','ignorecase','smartcase','incsearch','autowrite','hidden','number'],
  }

  exec { 'hyper_install': 
    command  
  }

  archive { '/tmp/hyper_3.0.2_amd64.deb':
    source => 'https://releases.hyper.is/download/deb',
    ensure => 'present',
    user   => 'justin',
    group  => 'justin',
  }
  
  package { 'hyper':
    ensure  => 'installed',
    provider => 'dpkg',
    source   => '/tmp/hyper_3.0.2_amd64.deb',
  }
  
  # apt htop, etc.
}
