set -e 

riscv64-unknown-linux-gnu-gcc file_wirter.c

mv a.out work/buildroot_initramfs_sysroot/usr/sbin/file_wirte.out

cp secure-iotest.sh work/buildroot_initramfs_sysroot/usr/sbin/

