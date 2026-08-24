#!/bin/bash

set -e

rm -f /etc/ssh/ssh_host_*

if command -v apt &> /dev/null; then
    apt -y autoremove --purge
    apt -y clean
    apt -y autoclean
elif command -v dnf &> /dev/null; then
    dnf clean all
fi

truncate -s 0 /etc/machine-id
rm -f /var/lib/dbus/machine-id
ln -s /etc/machine-id /var/lib/dbus/machine-id

if [ "$(command -v cloud-init)" ]; then
    cloud-init clean --logs --seed
fi