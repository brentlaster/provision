Feature: Check for Jenkins installation

Scenario: Run aptitude to ensure Jenkins is not installed.
When I run `aptitude search '^jenkins$'`
Then it should pass with regexp:
  """
  p[i] .* jenkins
  """

Scenario: Install Jenkins via puppet

When I run `puppet apply '/home/nfjsuser/provision/modules/jenkins.pp'`
Then it should pass with regexp:
 """
 notice: Finished catalog run
 """
When I run `aptitude search '^jenkins$'`
Then it should pass with regexp:
 """
 i .* jenkins
 """

When I run `chkconfig --list puppet`
Then it should pass with regexp:
 """
 on
 """

