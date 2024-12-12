#!/bin/bash

set -e

#==============================================================
# copy config & scripts 
#==============================================================

cp securecpu-config/config-linux freedom-u-sdk/work/linux/.config
cp securecpu-config/config-buildroot freedom-u-sdk/work/buildroot_initramfs/.config
cp securecpu-config/config-busybox freedom-u-sdk/work/buildroot_initramfs/build/busybox-1.24.2/.config

cp scripts/*.sh freedom-u-sdk
cp app/run-app freedom-u-sdk/work/buildroot_initramfs_sysroot/usr/sbin/run-app

#==============================================================
# apply linux patch and build  
#==============================================================

cd freedom-u-sdk
patch -p1 < ../securecpu-config/securecpu-linux.patch
patch -p1 < ../securecpu-config/add-bin-update.patch

sh ../full_build.sh
