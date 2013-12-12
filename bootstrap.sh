#!/usr/bin/env bash
# Bootstrap para ubuntu y debian.
# Solamente instala puppet.

set -e

OS=$(lsb_release -c -s)
REPO_DEB_URL="https://apt.puppetlabs.com/puppetlabs-release-${OS}.deb"

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

echo "Configurando repositorio PuppetLabs... "
wget -qO /tmp/puppetlabs-release-${OS}.deb ${REPO_DEB_URL} 2>/dev/null
dpkg -i /tmp/puppetlabs-release-${OS}.deb >/dev/null
rm -f /tmp/puppetlabs-release-${OS}.deb
aptitude update >/dev/null

echo "Actualizando sistema... "
aptitude safe-upgrade -y >/dev/null

echo "Instalando puppet... "
aptitude install puppet -y >/dev/null
