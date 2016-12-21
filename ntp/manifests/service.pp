class ntp::service (
     $ntp_service = $ntp::params::ntp_service, 
) inherits ntp::params {
	service {'NTP_Service':
	    ensure => running,
	    enable => true,
	    name => $ntp_service,
	    subscribe => Class['ntp::config'],
	}
}
