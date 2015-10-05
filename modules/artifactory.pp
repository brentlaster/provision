
class artifactory {
 
  notice("Starting artifactory on port 8083")
  
  exec {"start artifactory":	
        command => 'artifactory.sh start',
	cwd => "/opt/artifactory-oss-4.1.3",
	path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/bin:/opt/artifactory-oss-4.1.3/bin:",
  }


  service { "artifactory":
    ensure => running,
    require => Exec["start artifactory"],
  }
 
}

# must declare class to get it instantiated

class {'artifactory': }
