#!/bin/bash

set -e

if command -v apt-get &> /dev/null; then
    apt -y clean
    apt -y autoclean
    apt -y autoremove --purge
elif command -v dnf &> /dev/null; then
    dnf clean all
fi

rm -f /etc/ssh/ssh_host_*

truncate -s 0 /etc/machine-id
rm -f /var/lib/dbus/machine-id
ln -s /etc/machine-id /var/lib/dbus/machine-id

if [ "$(command -v cloud-init)" ]; then
    cloud-init clean --logs --seed
fi