class tomcat6 {
 
  $tomcat_port = 8090
  $tomcat_password = 'nfjsuser'
 
  notice("Setting up http://$hostname:$tomcat_port/")
 
  Package { # defaults
    ensure => installed,
  }
 
  package { 'tomcat6':
  }
 
  package { 'tomcat6-user':
    require => Package['tomcat6'],
  }
 
  package { 'tomcat6-admin':
    require => Package['tomcat6'],
  }
 
  file { "/etc/tomcat6/tomcat-users.xml":
    owner => 'root',
    require => Package['tomcat6'],
    notify => Service['tomcat6'],
    content => template('/home/nfjsuser/provision/templates/tomcat-users.xml.nfjs')
  }
 
  file { '/etc/tomcat6/server.xml':
     owner => 'root',
     require => Package['tomcat6'],
     notify => Service['tomcat6'],
     content => template('/home/nfjsuser/provision/templates/server.xml.nfjs'),
  }
 
	
  file {'/var/lib/tomcat6':
     require => Package['tomcat6'],
     ensure => directory,
     owner => tomcat6,
     group => tomcat6,
     mode => 755,
  }


  service { 'tomcat6':
    ensure => running,
    require => Package['tomcat6'],
  }
 
}

# must declare class to get it instantiated

class {'tomcat6': }
