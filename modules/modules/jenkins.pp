package { "jenkins":
    ensure => "installed"
}
file { "/var/lib/jenkins/plugins":
  source => "/home/diyuser/Jenkins/plugins",
  recurse => true,
}
service { "jenkins":
  enable => true,
}

