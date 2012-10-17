Feature: Check for Config installation

Scenario: Run aptitude to ensure Config is not installed.
When I run `aptitude search '^chkconfig$'`
Then it should pass with regexp:
  """
  p .* chkconfig
  """

Scenario: Install Config

When I run `apt-get -y install chkconfig`
Then it should pass with regexp:
 """
 Setting up chkconfig
 """

Scenario: Ensure Config-Common installed

When I run `aptitude search '^chkconfig$'`
Then it should pass with regexp:
 """
 i .* chkconfig
 """

