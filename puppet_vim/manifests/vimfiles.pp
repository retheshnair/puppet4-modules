#Copies vim syntax highlighting & formating files to the correct location
class puppet_vim::vimfiles(
  $vimdir = $puppet_vim::params::vimdir,
  $vimrc  = $puppet_vim::params::vimrc,
) inherits puppet_vim::params
{
  $vimrc_source = $puppet_vim::params::vimrc_source
  file { $vimdir :
    ensure  => 'directory',
    source  => 'puppet:///modules/puppet_vim/puppet_syntax/',
    recurse => true,
  }
  file { $vimrc :
    ensure => 'file',
    source => "puppet:///modules/puppet_vim/${vimrc_source}"
  }
}
