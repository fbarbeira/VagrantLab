#!/usr/bin/env bash
# Bootstrap for ubuntu and debian.
# This program makes a safe-upgrade and installs puppet.

set -e

OS=$(lsb_release -c -s)
RELEASE_FILE="puppetlabs-release-${OS}.deb"
REPO_DEB_URL="https://apt.puppetlabs.com/${RELEASE_FILE}"

if [[ "$EUID" -ne "0" ]]; then
  echo "This script must be run as root." >&2
  exit 1
fi

if [[ $(/usr/bin/dpkg -l) != *puppetlabs* ]]; then
  echo "Configuring Puppetlabs repository... "
  wget -qO "/tmp/${RELEASE_FILE}" ${REPO_DEB_URL} >/dev/null
  dpkg -i "/tmp/${RELEASE_FILE}" >/dev/null
  rm -f "/tmp/${RELEASE_FILE}"

  echo "Updating system..."
  aptitude update >/dev/null

  echo "Upgrading system... "
  DEBIAN_FRONTEND=noninteractive aptitude safe-upgrade -q -y >/dev/null
  echo "Installing puppet... "
  aptitude install puppet -y >/dev/null

  # Remove deprecated 'templatedir' var.
  sed -i '/templatedir=\$confdir\/templates/d' /etc/puppet/puppet.conf

else
  echo "Puppet is already installed."
fi
