#!/bin/bash

apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
apt-get install zip openjdk-8-jdk awscli -y

cd /home/ubuntu
curl -O https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/3.0.3/gatling-charts-highcharts-bundle-3.0.3-bundle.zip


unzip gatling-charts-highcharts-bundle-3.0.3-bundle.zip 
mv gatling-charts-highcharts-bundle-3.0.3 gatling
mkdir gatling/user-files/simulations/howitzer

aws s3 cp s3://bvdevopsthomas/howitzer.scala gatling/user-files/simulations/howitzer/howitzer.scala

gatling/bin/gatling.sh - rd "test" -s howitzer.howitzer




