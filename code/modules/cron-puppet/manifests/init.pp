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
    ensure => 'present',
    command => "cd /etc/puppetlabs/puppet
  }
}

