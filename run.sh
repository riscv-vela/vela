#!/bin/bash

set -e

SSH_HOST_PORT=2222
UBUNTU_IMAGE_FILE=ubuntu-24.04.2-preinstalled-server-riscv64.img
QEMU_MEM=2048
QEMU_CPUS=4

qemu-system-riscv64 \
	-machine virt -nographic -m ${QEMU_MEM} -smp ${QEMU_CPUS} \
	-kernel /usr/lib/u-boot/qemu-riscv64_smode/uboot.elf \
	-device virtio-net-device,netdev=eth0 -netdev user,id=eth0,hostfwd=tcp::${SSH_HOST_PORT}-:22 \
	-device virtio-rng-pci \
	-drive file=${UBUNTU_IMAGE_FILE},format=raw,if=virtio
