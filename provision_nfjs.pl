#!/usr/local/bin/perl
#
# provision_nfjs.pl - Sample file for demoing a way to
# provision an application using TDD/BDD
#
# 2012-10-16 - BCL - Created based on provision work by Lee Greene


# Install Cucumber

print "Creating baseline image for cucumber\n";
print "Installing Ruby 1.9.1\n";
$rc=`apt-get -y install ruby1.9.1`;
print "$rc\n";
print "Installing Rubygems\n";
$rc=`apt-get -y install rubygems`;
print "$rc\n";
print "Installing Cucumber\n";
$rc=`gem install cucumber`;
print "$rc\n";
print "Installing Aruba\n";
$rc=`gem install aruba`;
print "$rc\n";

# Create directory structure for cucumber
$rc=`mkdir -p features/support`;
$rc=`mkdir -p features/step_definitions`;

open FILE, ">features/support/env.rb" or die $!;
print FILE "require 'aruba/cucumber'\n";
print FILE "Before do\n";
print FILE "# Set a longer timeout for aruba\n";
print FILE "  \@aruba_timeout_seconds = 460\n";
print FILE "end\n";
close FILE;

$homedir="/home/nfjsuser/provision";

# Run cucumber chkconfig
$rc=`cd /home/nfjsuser/cucumber`;
print "Installing chkconfig\n";
$rc=`cucumber $homedir/features/chkconfig.feature`;
print "$rc\n";

# Run cucumber puppet

print "Installing puppet\n";
$rc=`cucumber $homedir/features/puppet.feature`;
print "$rc\n";

# Run cucumber jenkins

print "Installing Jenkins\n";
$rc=`cucumber $homedir/features/jenkins.feature`;
print "$rc\n";

# Run cucumber tomcat

print "Installing Tomcat\n";
$rc=`cucumber $homedir/features/tomcat.feature`;
print "$rc\n";

print "Done!\n";

exit 0;

