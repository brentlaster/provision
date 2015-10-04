Feature: Check for sysv-rc-conf installation

Scenario: Install sysv-rc-conf

When I run `apt-get -y install sysv-rc-conf`
Then it should pass with regexp:
 """
 Setting up sysv-rc-conf
 """

Scenario: Ensure sysv-rc-conf installed

When I run `aptitude search '^sysv-rc-conf$'`
Then it should pass with regexp:
 """
 i .* sysv-rc-conf
 """

