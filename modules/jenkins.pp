
file { "/var/lib/jenkins/plugins":
  source => "/home/diyuser/Jenkins/plugins",
  recurse => true,
  require => Package["jenkins"],
}


package { "jenkins":
    ensure => "installed"
}

service { "jenkins":
  enable => true,
  require => File["/var/lib/jenkins/plugins"]
}

