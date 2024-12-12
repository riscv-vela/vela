#!/bin/bash

CURDIR=$(pwd)

wrkdir=$CURDIR/work
qemu_wrkdir=$wrkdir/riscv-qemu
pk_wrkdir=$wrkdir/riscv-pk

bbl=$pk_wrkdir/bbl
rootfs=$wrkdir/rootfs.bin
qemu=$qemu_wrkdir/prefix/bin/qemu-system-riscv64

$qemu -nographic -machine virt -kernel $bbl \
	-drive file=$rootfs,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 \
	-netdev user,id=net0 -device virtio-net-device,netdev=net0
