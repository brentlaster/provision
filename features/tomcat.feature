Feature: Check for Tomcat installation

Scenario: Run aptitude to ensure Tomcat is not installed.
When I run `aptitude search '^tomcat6$'`
Then it should pass with regexp:
  """
  p[i] .* tomcat6
  """

Scenario: Run aptitude to ensure Tomcat-admin is not installed.
When I run `aptitude search '^tomcat6-admin$'`
Then it should pass with regexp:
  """
  p[i] .* tomcat6-admin
  """

Scenario: Install Tomcat via puppet

When I run `puppet apply '/home/nfjsuser/provision/modules/tomcat.pp'`
Then it should pass with regexp:
 """
 notice: Finished catalog run
 """

Scenario: Run aptitude to ensure Tomcat is installed.
When I run `aptitude search '^tomcat6$'`
Then it should pass with regexp:
 """
 i .* tomcat6
 """

Scenario: Run aptitude to ensure Tomcat-admin is installed.
When I run `aptitude search '^tomcat6-admin$'`
Then it should pass with regexp:
  """
  i .* tomcat6-admin
  """

When I run `chkconfig --list tomcat6`
Then it should pass with regexp:
 """
 on
 """

