### Git hook for puppet apply

class cron-puppet {
  file { 'post-hook':
    ensure => 'present',
    path   => '/etc/puppetlabs/puppet/.git/hooks/post-merge',
    source => 'puppet:///modules/cron-puppet/post-merge',
    mode   => 0755,
    owner  => 'root',
    group  => 'root',
  }

  cron { 'puppet-apply':
    ensure  => 'present',
    command => "cd /etc/puppetlabs ; /usr/bin/git pull",
    user    => 'root',
    group   => 'root',
    hour    => '09',
    minute  => '15',
    require => File['post-hook'],
  }
}

