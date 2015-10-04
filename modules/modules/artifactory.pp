class artifactory {
 
  $artifactory_port = 8081
  $artifactory_password = 'diyuser'
 
  notice("Setting up http://$hostname:$artifactory_port/")
 
  Package { # defaults
    ensure => installed,
  }
 
 

  service { 'artifactory':
    ensure => running,
    require => Package['artifactory'],
  }
 
}

# must declare class to get it instantiated

class {'artifactory': }
