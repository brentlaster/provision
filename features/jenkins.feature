Feature: Check for Jenkins installation

Scenario: Run aptitude to ensure Jenkins is not installed.
When I run `aptitude search '^jenkins$'`
Then it should pass with regexp:
  """
  p([i]?) .* jenkins
  """

Scenario: Install Jenkins via puppet

When I run `puppet apply '/home/diyuser/provision/modules/jenkins.pp'`
Then it should pass with regexp:
 """
 Notice: Finished catalog run
 """
When I run `aptitude search '^jenkins$'`
Then it should pass with regexp:
 """
 i .* jenkins
 """

When I run `sysv-rc-conf --list jenkins`
Then it should pass with regexp:
 """
 on
 """

