package { "jenkins":
    ensure => "installed"
}
file { "/var/lib/jenkins/plugins":
  source => "/home/nfjsuser/Jenkins/plugins",
  recurse => true,
}
service { "jenkins":
  enable => true,
}

