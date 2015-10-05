Feature: Check for Artifactory startup

Scenario: Startup Artifactory via puppet

When I run `puppet apply '/home/diyuser/provision/modules/artifactory.pp'`
Then it should pass with regexp:
 """
 Notice: Finished catalog run
 """

When I run `sysv-rc-conf --list artifactory`
Then it should pass with regexp:
 """
 on
 """

