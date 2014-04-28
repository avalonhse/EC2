# Manage nginx webserver
class nginx {
	package { 'apache2.2-common':
		ensure => absent,
	}
	package { 'nginx':
	ensure => installed,
	}
	service { 'nginx':
		ensure => running,
		require => Package['nginx'],
	}
}

