#!/bin/bash
set -e
source /build/buildconfig
set -x

## Brightbox Ruby 1.9.3, 2.0 and 2.1
echo deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu trusty main > /etc/apt/sources.list.d/brightbox.list

## Phusion Passenger
if [[ "$PASSENGER_ENTERPRISE" ]]; then
	echo deb https://download:$PASSENGER_ENTERPRISE_DOWNLOAD_TOKEN@www.phusionpassenger.com/enterprise_apt trusty main > /etc/apt/sources.list.d/passenger.list
else
	echo deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main > /etc/apt/sources.list.d/passenger.list
fi

## Chris Lea's Node.js PPA
echo deb http://ppa.launchpad.net/chris-lea/node.js/ubuntu trusty main > /etc/apt/sources.list.d/nodejs.list

## Rowan's Redis PPA
echo deb http://ppa.launchpad.net/rwky/redis/ubuntu trusty main > /etc/apt/sources.list.d/redis.list

## OpenJDK 8 PPA
echo deb http://ppa.launchpad.net/openjdk-r/ppa/ubuntu trusty main > /etc/apt/sources.list.d/openjdk8.list

# The recv-keys part takes a bit of time, so it's faster to receive multiple keys at once.
#
# Brightbox
# Phusion Passenger
# Chris Lea's Node.js PPA
# Rowan's Redis PPA
# OpenJDK 8 PPA
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys \
	C3173AA6 \
	561F9B9CAC40B2F7 \
	C7917B12 \
	5862E31D \
	DA1A4A13543B466853BAF164EB9B1D8886F44E2A

apt-get update
