define line($file, $line, $ensure = 'present') {
    case $ensure {
        default : { err ( "unknown ensure value ${ensure}" ) }
        present: {
            exec { "/bin/echo '${line}' >> '${file}'":
                unless => "/bin/grep -qFx '${line}' '${file}'"
            }
        }
        absent: {
            exec { "/bin/grep -vFx '${line}' '${file}' | /usr/bin/tee '${file}' > /dev/null 2>&1":
              onlyif => "/bin/grep -qFx '${line}' '${file}'"
            }

            # Use this resource instead if your platform's grep doesn't support -vFx;
            # note that this command has been known to have problems with lines containing quotes.
            # exec { "/usr/bin/perl -ni -e 'print unless /^\\Q${line}\\E\$/' '${file}'":
            #     onlyif => "/bin/grep -qFx '${line}' '${file}'"
            # }
        }
    }
}

class sonar {
 
  notice("Setting up sonar on port 9000")
  
  exec {'install sonar':
	require => Exec['apt-get update'],
        command => '/usr/bin/apt-get --force-yes -y install sonar',
  }




  exec { 'apt-get update':
        require => Line['sonar_source'],
        command => '/usr/bin/apt-get update',
  } 

  
  exec { 'start sonar':
        require => File['/opt/sonar/extensions/plugins/sonar-groovy-plugin-0.6.jar'],
	path => '/opt/sonar',
        command => '/opt/sonar/bin/alternate_sonar_startup.sh',
  }
  
  line {'sonar_source':
    file => '/etc/apt/sources.list',
    line => 'deb http://downloads.sourceforge.net/project/sonar-pkg/deb binary/',
  }


   
 
  file { '/opt/sonar/bin/alternate_sonar_startup.sh':
    require => Exec['install sonar'],
    owner => 'sonar',
    group => 'adm',
    mode => 0755,
    notify => Service['sonar'],
    content => '/home/nfjsuser/provision/templates/alternate_sonar_startup.sh'
  }
 

  file { '/opt/sonar/extensions/plugins/sonar-groovy-plugin-0.6.jar':
    require => File['/opt/sonar/bin/alternate_sonar_startup.sh'],
    owner => 'sonar',
    group => 'adm',
    mode => 0755,
    notify => Service['sonar'],
    content => '/home/nfjsuser/Downloads/sonar-groovy-plugin-0.6.jar'
  }
 
  service { 'sonar':
    ensure => running,
    require => Exec['install sonar'],
  }
 
}

# must declare class to get it instantiated

class {'sonar': }
