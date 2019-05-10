node default {
  include cron-puppet
  include '::ntp'
  include vim
}
