#!/usr/bin/env bash

#variables
activatorVersion="1.3.10"
sbtVersion="0.13.11"

echo "=========================================="
echo "Provision VM START"
echo "=========================================="

sudo apt-get update

###############################################
# install prerequisits
###############################################
sudo apt-get -y -q upgrade
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get -y -q update
sudo apt-get -y -q install software-properties-common htop
sudo apt-get -y -q install build-essential
sudo apt-get -y -q install tcl8.5

###############################################
# Install Java 8
###############################################
# sudo apt-get install -y openjdk-8-jdk
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get -y -q install oracle-java8-installer
sudo update-java-alternatives -s java-8-oracle

###############################################
# In case you need Java 7
###############################################
# sudo apt-get install -y openjdk-7-jdk
#echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
#sudo apt-get -y -q install oracle-java7-installer

###############################################
# Install Git
###############################################
sudo apt-get -y install git

###############################################
# Install imagemagick
###############################################
#sudo apt-get -y install imagemagick

###############################################
# Install Scala
###############################################
sudo apt-get -y install scala

###############################################
# Install Unzip
###############################################
sudo apt-get -y install unzip

###############################################
# Install SBT
###############################################
echo "Download SBT..."
wget http://dl.bintray.com/sbt/debian/sbt-$sbtVersion.deb
sudo dpkg -i sbt-$sbtVersion.deb
sudo apt-get update
sudo apt-get install sbt
rm sbt-$sbtVersion.deb

echo "SBT done."
# Use node as default JavaScript Engine
echo "export SBT_OPTS=\"\$SBT_OPTS -Dsbt.jse.engineType=Node\"" >> ~/.bashrc

###############################################
# Reset bash
###############################################
source ~/.bashrc

###############################################
# Show installation summary
###############################################
echo "=========================================="
echo "Provision VM summary"
echo "=========================================="
echo "Dependencies installed:"
echo " "
echo "jdk version:"
javac -version
echo " "
echo "=========================================="
echo "Provision VM finished"
echo "=========================================="
