class motd ($motd_message = 'Daily' ){
     $allowed = [ 
          '^Daily$',
          '^Weekly',
     ]
     validate_re( $motd_message, $allowed )
     file { '/etc/motd':
       ensure  => 'present',
       content => file("motd/${motd_message}"),
     }
}
