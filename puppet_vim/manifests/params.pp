#Params pattern used to calculate and store variables for installing
#vim syntax files for Puppet
class puppet_vim::params {
  case $::osfamily {
    'RedHat': {
      $vimdir       = '/usr/share/vim/vim74/'
      $vimrc        = '/etc/vimrc'
      $vimrc_source = 'redhat_vimrc'
      $vim_package  = 'vim-enhanced'
    }
    'Debian': {
      $vimdir       = '/etc/vim/'
      $vimrc        = '/etc/vim/vimrc.local'
      $vimrc_source = 'debian_vimrc'
      $vim_package  = 'vim'
    }
    'Solaris': {
      $vimdir       = '/usr/share/vim/vim73/'
      $vimrc        = '/usr/share/vim/vimrc'
      $vimrc_source = 'solaris_vimrc'
      $vim_package  = 'vim'
    }
    default: {
      fail( "Module ${module_name} isn't tested on ${::osfamily} based systems")
    }
  }
}
