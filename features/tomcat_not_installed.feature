Feature: Check for Tomcat installation

Scenario: Run aptitude to ensure Tomcat is not installed.
When I run `aptitude search '^tomcat6$'`
Then it should pass with regexp:
  """
  p .* tomcat6
  """

Scenario: Run aptitude to ensure Tomcat-admin is not installed.
When I run `aptitude search '^tomcat6-admin$'`
Then it should pass with regexp:
  """
  p .* tomcat6-admin
  """
