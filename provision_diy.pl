#!/usr/local/bin/perl
#
# provision_nfjs.pl - Sample file for demoing a way to
# provision an application using TDD/BDD
#
# 2012-10-16 - BCL - Created based on provision work by Lee Greene
# 2015-10-5 - BCL - Updated for new stack


# Install Cucumber

print "Creating baseline image for cucumber\n";
print "Installing aptitude";
$rc=`apt-get -y install aptitude`;
print "$rc\n"; 
print "Installing Ruby 1.9.1 dev\n";
$rc=`apt-get -y install ruby1.9.1-dev`;
print "$rc\n";
print "Installing Ruby 1.9.1 \n";
$rc=`apt-get -y install ruby1.9.1`;
print "$rc\n";
print "Installing Cucumber\n";
$rc=`gem install cucumber`;
print "$rc\n";
print "Installing Aruba\n";
$rc=`gem install aruba`;
print "$rc\n";

$homedir="/home/diyuser/provision";

# Run cucumber sysv-rc-conf
$rc=`cd /home/diyuser/cucumber`;
print "Installing sysv-rc-conf\n";
$rc=`cucumber $homedir/features/sysv-rc-conf.feature`;
print "$rc\n";

# Run cucumber puppet

print "Installing puppet\n";
$rc=`cucumber $homedir/features/puppet.feature`;
print "$rc\n";



# Run cucumber tomcat

print "Installing Tomcat\n";
$rc=`cucumber $homedir/features/tomcat.feature`;
print "$rc\n";


# Run cucumber artifactory
# Do this before tomcat because artifactory is not happy if tomcat is already running
print "Starting Artifactory\n";
$rc=`cucumber $homedir/features/artifactory.feature`;
print "$rc\n";

# Run cucumber jenkins

print "Installing Jenkins\n";
$rc=`cucumber $homedir/features/jenkins.feature`;
print "$rc\n";


print "Done!\n";

exit 0;

