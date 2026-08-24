#!/bin/bash

set -e

cp /tmp/reconfigure_ssh_host_keys.service /etc/systemd/system/reconfigure_ssh_host_keys.service
chown root:root /etc/systemd/system/reconfigure_ssh_host_keys.service
systemctl enable reconfigure_ssh_host_keys.service
rm /tmp/reconfigure_ssh_host_keys.service 