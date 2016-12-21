class ntp::config ( 
    $location = 'london',
)   {
    $valid_locations = [
     '^london$',
     '^paris$',
     '^nyc$',
    ]
    validate_re($location, $valid_locations)
    ntp::admin_file{ '/etc/ntp.conf': }
}
