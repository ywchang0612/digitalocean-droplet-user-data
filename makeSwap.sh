#!/bin/bash

# create swapfile
fallocate -l 2G /swapfile

# configure swap file
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile

# make swapfile persistent
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
sysctl vm.swappiness=10
sysctl vm.vfs_cache_pressure=50

# additional
echo 'vm.swappiness=10' >> /etc/sysctl.conf
echo 'vm.vfs_cache_pressure=50' >> /etc/sysctl.conf
