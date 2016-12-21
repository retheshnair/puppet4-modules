#Install to correct vim enhanced package 
class puppet_vim::vimpackages (
  $vim_package  = $puppet_vim::params::vim_package,
) inherits puppet_vim::params
{
  package { $vim_package :
    ensure => 'installed',
  }
}
