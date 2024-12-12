#!/bin/bash

current_directory=$(pwd)
export RISCV=$current_directory/toolchain

cd riscv-isa-sim
git checkout v1.0.0
mkdir build
cd build
../configure --prefix=$RISCV
make -j8
