sudo service tomcat6 stop
sudo apt-get remove --purge -y tomcat6*
sudo apt-get -y autoremove
clear
sudo puppet apply ./modules/tomcat.pp
