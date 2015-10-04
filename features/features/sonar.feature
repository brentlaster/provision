Feature: Check for Sonar installation

Scenario: Run aptitude to ensure Sonar is not installed.
When I run `aptitude search '^sonar$'`
Then it should pass with regexp:
  """
  p([i]?) .* sonar
  """

Scenario: Install Sonar via puppet

When I run `puppet apply '/home/diyuser/provision/modules/sonar.pp'`
Then it should pass with regexp:
 """
 notice: Finished catalog run
 """

Scenario: Run aptitude to ensure Sonar is installed.
When I run `aptitude search '^sonar$'`
Then it should pass with regexp:
 """
 i .* sonar
 """

When I run `chkconfig --list sonar`
Then it should pass with regexp:
 """
 on
 """

