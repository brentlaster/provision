Feature: Check for Config installation

Scenario: Install Config

When I run `apt-get -y install sysv-rc-conf`
Then it should pass with regexp:
 """
 Setting up sysv-rc-conf
 """

