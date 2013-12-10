#!/usr/bin/env bash

# Usamos el bash provisioner solo para instalar puppet.

OS=$1

wget -qO /tmp/puppetlabs-release-${OS}.deb \
	https://apt.puppetlabs.com/puppetlabs-release-${OS}.deb
dpkg -i /tmp/puppetlabs-release-${OS}.deb
rm -f /tmp/puppetlabs-release-${OS}.deb
aptitude update
aptitude safe-upgrade -y
aptitude install puppet -y
