#!/bin/bash
chown -R n3m:n3m /home/n3m
echo "n3m    ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
