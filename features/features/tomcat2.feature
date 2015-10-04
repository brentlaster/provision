Feature: Check for Tomcat installation

Scenario: Install Tomcat via puppet

When I run `puppet apply '/home/diyuser/provision/modules/tomcat.pp'`
Then it should pass with regexp:
  """
  Notice
  """


