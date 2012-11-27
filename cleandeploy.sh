#!/bin/bash
sudo /etc/init.d/tomcat6 stop
sudo -S rm -rf /var/lib/tomcat6/webapps/roar*
sudo /etc/init.d/tomcat6 start

