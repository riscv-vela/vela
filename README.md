
## 1. Project Name and Meaning

Project Name: Vela

Meaning:

“Vela” is derived from a constellation name, meaning “the sail that opens a voyage.” This project symbolizes opening a new voyage for Software-Defined
Robotics (SDR) through open RISC-V–based system software technologies.

## 2. Project Purpose
This project aims to establish an open ecosystem for intelligent service robots (SDR: Software-Defined Robotics) by developing open RISC-V–based system software technologies that are royalty-free and independent from foreign, closed computing platforms.
Currently, most robot platforms depend on closed systems based on ARM or x86 architectures, which limit hardware flexibility and impose high licensing costs and vendor lock-in issues. These limitations hinder technological innovation, scalability,and autonomous development.
This research seeks to create an open RISC-V–based SDR computing platform that enables flexible hardware configurations and optimization, reducing reliance on foreign technologies.
RISC-V is an open instruction set architecture (ISA) that allows anyone to extend, customize, and implement it without royalties. Based on this RISC-V architecture,the project focuses on developing the following core system software technologies:
 - Low Power: Maximize energy efficiency through power management and thermal control
 - High Performance: Integrate multiple AI execution engines and apply multimodel scheduling for performance optimization
 - High Reliability: Support a Trusted Execution Environment (TEE) for confidential computing
 - High Availability: Implement RAS (Error-record Register Interface) for system error prediction, recovery, and continuous operation
   
By integrating these technologies, the project will build a RISC-V Linux kernel–based system software distribution, incorporating AI execution engines, ROS2 (DDS)-based middleware, compilers, profilers, and verification emulators to create an open software platform for intelligent robotics.
Ultimately, the goal is to strengthen the domestic RISC-V system software ecosystem, enhance competitiveness in various SDx (On-Device AI) industries, and promote both technological self-reliance and global open-source collaboration.

## 3. License
The Vela project is an open RISC-V–based SDR system software stack that includes multiple open-source components such as the Linux kernel, ROS2, and Ubuntu packages. Therefore, it is distributed under a multi-license open-source scheme, where each component retains its original license.
 - Linux Kernel: GPL-2.0 only
 - ROS2: Apache-2.0 / BSD-3-Clause
 - Ubuntu Packages: GPL, LGPL, MIT, BSD, and other upstream licenses

## 4. Development Environment
To verify the functionality and performance of the RISC-V–based SDR system software (Vela), the project establishes a dual testing environment: a QEMU-based
virtual platform (Q-Vela) and an FPGA-based hardware validation platform (F-Vela).

Q-Vela (https://github.com/riscv-vela/q-vela):
QEMU-based RISC-V virtual emulation environment that validates integrated SDR distribution functions for low power, high performance, high reliability, and high
availability. It focuses on function-level testing and is used to validate AI engine extensions, vector unit features, and Linux kernel/ROS2 integration.

F-Vela (https://github.com/riscv-vela/f-vela):
FPGA-based RISC-V hardware acceleration and performance measurement platform. It performs real hardware validation for functions verified in Q-Vela, focusing on metrics such as performance and power efficiency.

## 5. Building the Vela System Image

### Requirements

Install required packages with following commands.

```
sudo apt update
sudo apt install opensbi qemu-system-misc u-boot-qemu qemu-user-static binfmt-support
```

### Preparing ubuntu image

Execute init.sh for preparing ubuntu image.

```
./init.sh
```
### Running QEMU

Execute run.sh for running qemu.

```
./run.sh
```

Login with the user vela without password.

Port 2222 of localhost is forwarded to port 22 (ssh) of virtual machine.

```
ssh -p 2222 vela@localhost
```

## 6. Release Policy
The Vela project follows a regular release cycle. All major features and patches are merged after integration testing and are officially released twice a year (August
and November).
 - Summer Release: Every August — includes new feature integration and results from the first half of the year
 - Winter Release: Every November — focuses on performance improvement and system stabilization
Versioning follows the format: v<Year>.<Cycle>. Examples:
 - v2025.1 → August 2025 Release
 - v2025.2 → November 2025 Release

## 7. Developer Guide
The Vela project operates entirely on GitHub-based open collaboration to build an open RISC-V system software ecosystem. Developers and contributors are expected
to follow the standardized process for development, build, testing, and patch submission.

- [ Add Patch format ]

```
