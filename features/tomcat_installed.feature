Feature: Check for Tomcat installation

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
