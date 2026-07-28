
## 1. Introduction

“Vela” is a Linux-based custom operating system for an open RISC-V platform designed for Software-Defined Robotics (SDR).

Vela is being developed to integrate low-power, high-efficiency, high-reliability, and high-availability technologies. At its current stage, the project focuses on building a system software distribution that incorporates a RISC-V Linux kernel enhanced with high-reliability features.

It also supports AI execution engines and ROS 2/DDS-based middleware, providing an open and lightweight software distribution for future intelligent robots.

As an Ubuntu-based custom operating system, the Vela distribution can boot on 
  - [Q-Vela](https://github.com/riscv-vela/q-vela), an SDR S/W emulation platform provided by the RISC-V Vela project
  - [F-Vela](https://github.com/riscv-vela/f-vela) and [I-Vela](https://github.com/riscv-vela/i-vela) hardware verification environments(**currently under development**).
  - Additionally, SiFive’s HiFive [Premier P550](https://www.sifive.com/boards/hifive-premier-p550) development board.

## 2. License
The Vela is an open RISC-V–based SDR system software stack that includes multiple open-source components such as the Linux kernel, ROS2, and Ubuntu packages. Therefore, it is distributed under a multi-license open-source scheme, where each component retains its original license.
 - Linux Kernel: GPL-2.0 only
 - ROS2: Apache-2.0 / BSD-3-Clause
 - Ubuntu Packages: GPL, LGPL, MIT, BSD, and other upstream licenses

## 3. Development Environment
To verify the functionality and performance of the RISC-V–based SDR system software (Vela), the project establishes a dual testing environment: a QEMU-based
virtual platform (Q-Vela) and an FPGA-based hardware validation platform (F-Vela).

Q-Vela (https://github.com/riscv-vela/q-vela):
QEMU-based RISC-V virtual emulation environment that validates integrated SDR distribution functions for low power, high performance, high reliability, and high
availability. It focuses on function-level testing and is used to validate AI engine extensions, vector unit features, and Linux kernel/ROS2 integration.

F-Vela (https://github.com/riscv-vela/f-vela):
FPGA-based RISC-V hardware acceleration and performance measurement platform. It performs real hardware validation for functions verified in Q-Vela, focusing on metrics such as performance and power efficiency.

## 4. Building the Vela System Image

### Requirements

Install required packages with following commands.

```
sudo apt update
sudo apt install opensbi qemu-system-misc u-boot-qemu qemu-user-static binfmt-support debootstrap
```

### Preparing ubuntu image for Q-Vela

Execute init.sh for preparing ubuntu image.

```
./init.sh
```
### Running QEMU(Q-Vela)

Execute run.sh for running qemu.

```
./run.sh
```

Login with the user vela without password.

Port 2222 of localhost is forwarded to port 22 (ssh) of virtual machine.

```
ssh -p 2222 vela@localhost
```

## 5. Release Policy
The Vela project follows a regular release cycle. All major features and patches are merged after integration testing and are officially released twice a year (August
and November).
 - Summer Release: Every August — includes new feature integration and results from the first half of the year
 - Winter Release: Every November — focuses on performance improvement and system stabilization
Versioning follows the format: v<Year>.<Cycle>. Examples:
 - v2025.1 → August 2025 Release
 - v2025.2 → November 2025 Release

## 6. Developer Guide
The Vela project operates entirely on GitHub-based open collaboration to build an open RISC-V system software ecosystem. Developers and contributors are expected
to follow the standardized process for development, build, testing, and patch submission.

- [ Add Patch format ]

```
