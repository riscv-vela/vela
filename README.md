# RISCV Vela
Welcome to the official GitHub repository of the RISC-V Based Software-Defined Robotics project. This repository serves as a central hub for system software development to support robotics applications built on the RISC-V architecture.

## Overview
This repository focuses on expanding the Software-Defined Robotics (SDR) ecosystem using RISC-V hardware extension technologies and system software. The project name, Vela, means "sail" in Latin, symbolizing a starting point for applying RISC-V technology in the SDR field.


## License
• Linux Kernel: Licensed under the GNU General Public License version 2 (GPLv2).
• ROS2: Licensed under Apache 2.0.


## Repository Structure

TDB


## Requirement List
This repository includes tools for the development environment, Linux kernel, middleware, and the Robot Operating System (ROS2). To meet the demands of SDR applications, the following features are added to existing open-source capabilities:
1. Low Power Consumption: Enabling robots to operate for extended periods on a single charge.
2. High Efficiency: Optimizing performance for image recognition and AI processing under constrained space and power conditions.
3. High Reliability: Ensuring stability and trustworthiness of ROS2-based robots through process isolation between ROS2 applications.
4. High Availability: Managing and controlling hardware and software faults within robotic systems.
5. Message Delivery Optimization: Enhancing inter-application message delivery performance in ROS2.


# meta-riscv-vela

RISC-V Vela Layer for OpenEmbedded/Yocto

## Description

More information can be found at: <https://github.com/riscv-vela/> (Official Site)

## Quick Start

### Kas Support

KAS is a Python-based tool designed to automate Yocto-based builds.
See [https://kas.readthedocs.io/](https://kas.readthedocs.io/)

Kas build is supported, you can run the following commands:

```text
git clone https://github.com/riscv-vela/meta-riscv-vela.git
cd meta-riscv-vela
```

* For basic `qemuriscv64` build run:

```text
kas build kas/riscv-vela.yml
```

**riscv-vela.yml** will build `riscv-vela-image-core`, you can then boot it with:

```text
kas shell -c "runqemu nographic" kas/riscv-vela.yml
```

**NOTE** `nographic` is needed for this image, because it has no graphical support for graphical Qemu run.

### linux kernel

#### Change configuration

If you need to change linux kernel configuration, append to recipes-kernel/linux/linux-yocto/riscv-vela.cfg.

#### Modify source code

If you need to change linux kernel source, edit files in build/tmp/work-shared/qemuriscv64/kernel-source.
And then, run the following commands: 

```text
kas build --target linux-yocto -c compile kas/riscv-vela.yml -- -f && kas build --target linux-yocto kas/riscv-vela.yml
```
