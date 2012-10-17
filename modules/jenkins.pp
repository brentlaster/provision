package { "jenkins":
    ensure => "installed"
}
service { "jenkins":
  enable => true,
}

