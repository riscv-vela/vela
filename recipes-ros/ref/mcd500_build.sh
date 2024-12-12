#!/bin/bash

mkdir mcd500

cd mcd500

work_base=$(pwd)

git clone https://github.com/riscv/riscv-gnu-toolchain.git

cd riscv-gnu-toolchain

git checkout afcc8bc655d30cf6af054ac1d3f5f89d0627aa79 #latest working commit

# add changed url
git config --global url.https://gitlab.com/qemu-project/.insteadOf git://git.qemu-project.org/
git config --global url.https://git.qemu.org/git/.insteadOf git://git.qemu.org/
git config --global url.https://anongit.freedesktop.org/git/.insteadOf git://anongit.freedesktop.org/
git config --global url.https://github.com/riscv.insteadOf git://github.com/riscv
git config --global url.https://github.com/.insteadOf git://github.com/

git submodule update --recursive --init

# recover url
#git config --global --unset url.https://github.com/.insteadOf

./configure --prefix=$work_base/riscv-toolchain

make linux -j8

#add PATH
PATH=$PATH:$work_base/riscv-toolchain/bin

cd $work_base

git clone https://github.com/mcd500/freedom-u-sdk.git

cd freedom-u-sdk

git checkout 29fe529f8dd8e1974fe1743184b3e13ebb2a21dc

git submodule update --recursive --init

cd buildroot

git checkout c4ddfe7a5fd964274c99033bd87df3dc7534d196 # "sifive" buildroot branch

cd ..

echo "BR2_PACKAGE_TREE=y" >> $work_base/freedom-u-sdk/conf/buildroot_initramfs_config
echo "BR2_PACKAGE_OPENSSL=y" >> $work_base/freedom-u-sdk/conf/buildroot_initramfs_config
echo "BR2_PACKAGE_OPENSSL_BIN=y" >> $work_base/freedom-u-sdk/conf/buildroot_initramfs_config
echo "BR2_PACKAGE_GNUPG2=y" >> $work_base/freedom-u-sdk/conf/buildroot_initramfs_config
echo "BR2_PACKAGE_SCREEN=y" >> $work_base/freedom-u-sdk/conf/buildroot_initramfs_config
echo "BR2_PACKAGE_NANO=y" >> $work_base/freedom-u-sdk/conf/buildroot_initramfs_config
echo "BR2_PACKAGE_GCC=y" >> $work_base/freedom-u-sdk/conf/buildroot_initramfs_config
echo "BR2_PACKAGE_HAVEGED=y" >> $work_base/freedom-u-sdk/conf/buildroot_initramfs_config
echo ".PHONY: qemulite" >> $work_base/freedom-u-sdk/Makefile
echo "qemulite: \$(qemu) \$(bbl) \$(rootfs)" >> $work_base/freedom-u-sdk/Makefile

make  all qemulite -j8

mkdir -p $work_base/compiled