
class sonar {

  $app_name = 'sonar'
  $app_version = '3.2.1'
  $app_url = 'dist.sonar.codehaus.org'
 
  notice('Setting up sonar on port 9000')

  Package { # defaults
    ensure => installed,
  }
 
  package { 'wget':
  }
 
  package { 'unzip':
  }

  exec { 'start sonar':
        require => File['/usr/local/sonar/extensions/plugins/sonar-groovy-plugin-0.6.jar'],
	path => '/usr/local',
        command => 'sonar/bin/linux-x86-32/sonar.sh start',
  }

  
  file { '/usr/local/sonar/extensions/plugins/sonar-groovy-plugin-0.6.jar':
    require => [ Exec["app_link_${app_name}"] ],
    owner => 'sonar',
    group => 'adm',
    mode => 0755,
    notify => Service['sonar'],
    content => '/home/nfjsuser/Downloads/sonar-groovy-plugin-0.6.jar',
  }
 
   exec {
      "app_wget_${app_name}":
            command   => "/usr/bin/wget http://${app_url}/${app_name}-${app_version}.zip -O /tmp/${app_name}.zip",
            logoutput => on_failure,
            creates   => "/tmp/${app_name}.zip",
            require   => [ Package["wget"] ];

      "app_unzip_${app_name}":
            cwd     => "/usr/local",
            command => "/usr/bin/unzip /tmp/${app_name}.zip",
            creates => "/usr/local/${app_name}-{$app_version}",
            require => [ Package["unzip"], Exec["app_wget_${app_name}"] ];
      
       "app_link_${app_name}":
	    cwd     => "/usr/local",
	    command => "/bin/ln -s ${app_name}-${app_version} ${app_name}",
	    creates => "/usr/local/${app_name}",
	    require => [ Exec["app_unzip_${app_name}"]];

    }

  
  service { 'sonar':
  #  ensure => running,
  #  require => File['/usr/local/sonar/extensions/plugins/sonar-groovy-plugin-0.6.jar'],
     require => Exec['start sonar'],
  }
 
}

# must declare class to get it instantiated

class {'sonar': }
