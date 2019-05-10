node default {
  include ntp
  include tree
  include docker

  class { '::vim':
    opt_misc => ['hlsearch','showcmd','showmatch','ignorecase','smartcase','incsearch','autowrite','hidden','number'],
  }
}
