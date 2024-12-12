#!/bin/bash

current_directory=$(pwd)

cd riscv-gnu-toolchain

./configure --prefix=$current_directory/toolchain

cd $current_directory

unset RISCV

make -j8 BOARD=vc707devkit

# make sim

# make qemu

