Feature: Check for Puppet installation

Scenario: Run aptitude to ensure Puppet is not installed.
When I run `aptitude search '^puppet$'`
Then it should pass with regexp:
  """
  p([i]?) .* puppet
  """

Scenario: Install Puppet-common

When I run `apt-get -y install puppet-common`
Then it should pass with regexp:
 """
 Setting up puppet-common
 """

Scenario: Ensure Puppet-Common installed

When I run `aptitude search '^puppet-common$'`
Then it should pass with regexp:
 """
 i .* puppet-common
 """


