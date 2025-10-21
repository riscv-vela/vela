#!/bin/bash

set -e

ARCH=riscv64
CACHE_DIR=$(realpath debootstrap_packages)
SUITE=noble
MIRROR=http://ports.ubuntu.com/ubuntu-ports
INCLUDE_PACKAGES=linux-image-generic

DISK_IMAGE_NAME=ubuntu-${SUITE}-${ARCH}.img
DISK_IMAGE_SIZE=16G

DEBOOTSTRAP_OPT="--arch=${ARCH} --foreign"
if [ -d ${CACHE_DIR} ]; then
	DEBOOTSTRAP_OPT="${DEBOOTSTRAP_OPT} --cache-dir=${CACHE_DIR}"
fi
if [ -n "${INCLUDE_PACKAGES}" ]; then
	DEBOOTSTRAP_OPT="${DEBOOTSTRAP_OPT} --include=${INCLUDE_PACKAGES}"
fi

qemu-img create -f raw ${DISK_IMAGE_NAME} ${DISK_IMAGE_SIZE}
sudo parted ${DISK_IMAGE_NAME} --script -- mklabel msdos mkpart primary ext4 1MiB 100%

LOOP_DEV=$(sudo losetup --find --show --partscan ${DISK_IMAGE_NAME})

sudo mkfs.ext4 ${LOOP_DEV}p1
TARGET_DIR=$(mktemp -d mnt-XXXX)
sudo mount ${LOOP_DEV}p1 ${TARGET_DIR}

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

sudo debootstrap ${DEBOOTSTRAP_OPT} ${SUITE} ${TARGET_DIR} ${MIRROR}
echo "/debootstrap/debootstrap --second-stage" | sudo chroot ${TARGET_DIR}
echo "locale-gen en_US en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && adduser vela && passwd -d vela && usermod -aG sudo vela" | sudo chroot ${TARGET_DIR}
sudo mkdir ${TARGET_DIR}/boot/extlinux
sudo cp extlinux.conf ${TARGET_DIR}/boot/extlinux/extlinux.conf
sudo cp netcfg.yaml ${TARGET_DIR}/etc/netplan/01-netcfg.yaml

sudo umount ${TARGET_DIR}
rmdir ${TARGET_DIR}

sudo losetup -d ${LOOP_DEV}
