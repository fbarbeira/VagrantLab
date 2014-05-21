#!/usr/bin/env bash
# Bootstrap for ubuntu and debian.
# This program only installs puppet.

set -e

OS=$(lsb_release -c -s)
REL_FILE="puppetlabs-release-${OS}.deb"
REPO_DEB_URL="https://apt.puppetlabs.com/${REL_FILE}"

if [[ "$EUID" -ne "0" ]]; then
  echo "This script must be run as root." >&2
  exit 1
fi

if [[ $(/usr/bin/dpkg -l) != *puppetlabs* ]]; then
  if [[ ${OS} -eq 'trusty' ]]; then
    aptitude purge -y ruby-hiera >/dev/null
  fi
  echo "Configuring Puppetlabs repository... "
  wget -qO "/tmp/${REL_FILE}" ${REPO_DEB_URL} 2>/dev/null
  dpkg -i "/tmp/${REL_FILE}" >/dev/null
  rm -f "/tmp/${REL_FILE}"
  aptitude update >/dev/null

  echo "Updating system... "
  aptitude safe-upgrade -y >/dev/null

  echo "Installing puppet... "
  aptitude install puppet -y >/dev/null
else
  echo "Puppet is already installed."
fi
