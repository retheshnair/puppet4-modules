#puppet_vim/manifests/init.pp
class puppet_vim {
  include puppet_vim::vimpackages
  include puppet_vim::vimfiles
}
