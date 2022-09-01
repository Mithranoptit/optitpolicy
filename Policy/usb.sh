#!/bin/bash
rm -rf /etc/modprobe.d/usb-storage.conf
echo "install usb-storage /bin/true" >> /etc/modprobe.d/usb-storage.conf
echo "Usb blocked" >> /var/optit/logs/policy.log

