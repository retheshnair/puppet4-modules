$source_dir = '/tmp/apt'
$target_dir = '/tmp/aptnew'
file { $target_dir :
  ensure  => 'directory',
  source  => "file://${source_dir}",
  recurse => true,
  before  => File[$source_dir],
}
file { $source_dir :
  ensure  => 'absent',
  purge   => true,
  recurse => true,
  force   => true,
}
