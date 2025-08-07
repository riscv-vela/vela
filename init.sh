#!/bin/bash

set -e

DISK_IMAGE="ubuntu-24.04.2-preinstalled-server-riscv64.img"
DOWNLOAD_URL_BASE="https://cdimage.ubuntu.com/releases/noble/release"
NBD_DEV="/dev/nbd0"
QEMU_STATIC="qemu-riscv64-static"

apt_install_cmd() {
	echo "apt-get --yes update"
	echo "apt-get --yes upgrade"
	echo "apt-get --yes install $@"
	echo "apt-get --yes clean"
}

print_cmds() {
	apt_install_cmd gdb
}

run_cmd_in_qemu() {
	print_cmds | sudo chroot ${1}
}

# prepare ubuntu base image
if [ ! -e ${DISK_IMAGE} ]; then
	if [ ! -e ${DISK_IMAGE}.xz ]; then
		wget ${DOWNLOAD_URL_BASE}/${DISK_IMAGE}.xz
	fi
	xz -dk ${DISK_IMAGE}.xz
	qemu-img resize -f raw ${DISK_IMAGE} +1G
fi

sudo modprobe nbd

# connect DISK_IMAGE to nbd device
sudo qemu-nbd -c ${NBD_DEV} -f raw ${DISK_IMAGE}

# mount rootfs
MOUNT_POINT=$(mktemp -d mnt-XXXX)
sudo mount ${NBD_DEV}p1 ${MOUNT_POINT}

# copy qemu binary
sudo cp /usr/bin/${QEMU_STATIC} ${MOUNT_POINT}/usr/bin/

run_cmd_in_qemu ${MOUNT_POINT}

# remove qemu binary
sudo rm ${MOUNT_POINT}/usr/bin/${QEMU_STATIC}

# unmount rootfs
sudo umount ${MOUNT_POINT}
rmdir ${MOUNT_POINT}

# disconnect nbd device
sudo qemu-nbd -d ${NBD_DEV}
