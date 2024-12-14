# RISCV Vela
Welcome to the official GitHub repository of the RISC-V Based Software-Defined Robotics project. This repository serves as a central hub for system software development to support robotics applications built on the RISC-V architecture.

## Overview
This repository focuses on expanding the Software-Defined Robotics (SDR) ecosystem using RISC-V hardware extension technologies and system software. The project name, Vela, means "sail" in Latin, symbolizing a starting point for applying RISC-V technology in the SDR field.

![image](https://github.com/user-attachments/assets/84a594db-c45c-42b5-aa9e-ed8f45364aeb)



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

## ROS 2 Documentation

This repository contains the sources for the ROS 2 documentation hosted at [docs.ros.org](https://docs.ros.org/en). The sources are built and uploaded nightly by a [Jenkins job](https://build.ros.org/job/doc_ros2doc).

---

### Contributing to the Documentation

Contributions to this site are highly welcomed!  
Please refer to the [Contributing to ROS 2 Documentation](https://docs.ros.org/en/rolling/The-ROS2-Project/Contributing/Contributing-To-ROS-2-Documentation.html) page for guidelines.

---

### Contributing to ROS 2

To contribute to the ROS 2 source code project, see the [ROS 2 contributing guidelines](https://docs.ros.org/en/rolling/The-ROS2-Project/Contributing.html).

---

### Development Environment

#### Pinned Versions

- **Development Platform**: Currently using Noble as the build platform.
- **Python Dependencies**: Versions are pinned in a constraints file for reproducibility.  
  Use the following command to update dependencies and lock versions:
  ```bash
  pip freeze > constraints.txt

## System Setup

### Set Locale
Ensure a UTF-8 supported locale is set. For minimal environments like Docker, use the following commands:

  ```bash
  sudo apt update && sudo apt install locales
  sudo locale-gen en_US en_US.UTF-8
  sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
  export LANG=en_US.UTF-8
  locale  # Verify settings
  ```

### Enable Required Repositories
Enable the Universe repository:

  ```bash
  sudo apt install software-properties-common
  sudo add-apt-repository universe
  ```

### Add the ROS 2 GPG key and repository:

  ```bash
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
  ```

### Install Development Tools

  ```bash
sudo apt update && sudo apt install -y \
  python3-flake8-blind-except \
  python3-flake8-class-newline \
  python3-flake8-deprecated \
  python3-mypy \
  python3-pip \
  python3-pytest \
  python3-pytest-cov \
  python3-pytest-mock \
  python3-pytest-repeat \
  python3-pytest-rerunfailures \
  python3-pytest-runner \
  python3-pytest-timeout \
  ros-dev-tools
  ```

## Building ROS 2

### Get ROS 2 Code
Create a workspace and clone repositories:

  ```bash
mkdir -p ~/ros2_jazzy/src
cd ~/ros2_jazzy
vcs import --input https://raw.githubusercontent.com/ros2/ros2/jazzy/ros2.repos src
  ```

##c Install Dependencies
Ensure the system is up to date and install dependencies:

  ```bash
sudo apt upgrade
sudo rosdep init
rosdep update
rosdep install --from-paths src --ignore-src -y --skip-keys "fastcdr rti-connext-dds-6.0.1 urdfdom_headers"
  ```

### Build the Workspace
Build the code with colcon:

  ```bash
cd ~/ros2_jazzy/
colcon build --symlink-install
  ```

If certain packages cause build issues, skip them using:
  ```bash
colcon build --symlink-install --packages-skip <package_name>
  ```

### Environment Setup
Source the environment setup file:

  ```bash
. ~/ros2_jazzy/install/local_setup.bash
  ```


### Running Examples
Start the Talker (C++):

  ```bash
. ~/ros2_jazzy/install/local_setup.bash
ros2 run demo_nodes_cpp talker
  ```

Start the Listener (Python):

  ```bash
. ~/ros2_jazzy/install/local_setup.bash
ros2 run demo_nodes_py listener
  ```


Result:
  ```bash
oot@99a26e6e8a24:/work/ubuntu-ros2-dev# ros2 run demo_nodes_cpp talker
[INFO] [1732951534.389697046] [talker]: Publishing: 'Hello World: 1'
[INFO] [1732951535.390516232] [talker]: Publishing: 'Hello World: 2'
[INFO] [1732951536.387399599] [talker]: Publishing: 'Hello World: 3'
[INFO] [1732951537.390925209] [talker]: Publishing: 'Hello World: 4'
[INFO] [1732951538.391165909] [talker]: Publishing: 'Hello World: 5'
[INFO] [1732951539.389802040] [talker]: Publishing: 'Hello World: 6'
^C[INFO] [1732951539.492913128] [rclcpp]: signal_handler(signum=2)
root@99a26e6e8a24:/work/ubuntu-ros2-dev# ros2 run demo_nodes_cpp talker &
[1] 269847
root@99a26e6e8a24:/work/ubuntu-ros2-dev# [INFO] [1732951548.834187928] [talker]: Publishing: 'Hello World: 1'
[INFO] [1732951549.836074294] [talker]: Publishing: 'Hello World: 2'
[INFO] [1732951550.834373071] [talker]: Publishing: 'Hello World: 3'
[INFO] [1732951551.833693585] [talker]: Publishing: 'Hello World: 4'
[INFO] [1732951552.832496922] [talker]: Publishing: 'Hello World: 5'
[INFO] [1732951553.837428390] [talker]: Publishing: 'Hello World: 6'
[INFO] [1732951554.837625417] [talker]: Publishing: 'Hello World: 7'
[INFO] [1732951555.832116744] [talker]: Publishing: 'Hello World: 8'
[INFO] [1732951556.832694909] [talker]: Publishing: 'Hello World: 9'
ros2 run demo_nodes_py listener[INFO] [1732951557.835554835] [talker]: Publishing: 'Hello World: 10'
ros2 run demo_nodes_py listener
[INFO] [1732951558.837004571] [talker]: Publishing: 'Hello World: 11'
[INFO] [1732951559.833874335] [talker]: Publishing: 'Hello World: 12'
[INFO] [1732951559.866716699] [listener]: I heard: [Hello World: 12]
[INFO] [1732951560.833103646] [talker]: Publishing: 'Hello World: 13'
[INFO] [1732951560.836635626] [listener]: I heard: [Hello World: 13]
[INFO] [1732951561.837261611] [talker]: Publishing: 'Hello World: 14'
[INFO] [1732951561.840662095] [listener]: I heard: [Hello World: 14]
[INFO] [1732951562.837272870] [talker]: Publishing: 'Hello World: 15'
[INFO] [1732951562.839853712] [listener]: I heard: [Hello World: 15]
[INFO] [1732951563.837317218] [talker]: Publishing: 'Hello World: 16'
[INFO] [1732951563.840274799] [listener]: I heard: [Hello World: 16]
^Croot@99a26e6e8a24:/work/ubuntu-ros2-dev# [INFO] [1732951564.837346196] [talker]: Publishing: 'Hello World: 17'
ps
    PID TTY          TIME CMD
      1 pts/0    00:00:00 bash
 269847 pts/0    00:00:00 ros2
 269850 pts/0    00:00:00 talker
 269890 pts/0    00:00:00 ps
root@99a26e6e8a24:/work/ubuntu-ros2-dev# [INFO] [1732951565.836178840] [talker]: Publishing: 'Hello World: 18'
oot@99a26e6e8a24:/work/ubuntu-ros2-dev# ros2 run demo_nodes_cpp talker
[INFO] [1732951534.389697046] [talker]: Publishing: 'Hello World: 1'
[INFO] [1732951535.390516232] [talker]: Publishing: 'Hello World: 2'
[INFO] [1732951536.387399599] [talker]: Publishing: 'Hello World: 3'
[INFO] [1732951537.390925209] [talker]: Publishing: 'Hello World: 4'
[INFO] [1732951538.391165909] [talker]: Publishing: 'Hello World: 5'
[INFO] [1732951539.389802040] [talker]: Publishing: 'Hello World: 6'
^C[INFO] [1732951539.492913128] [rclcpp]: signal_handler(signum=2)
root@99a26e6e8a24:/work/ubuntu-ros2-dev# ros2 run demo_nodes_cpp talker &
[1] 269847
root@99a26e6e8a24:/work/ubuntu-ros2-dev# [INFO] [1732951548.834187928] [talker]: Publishing: 'Hello World: 1'
[INFO] [1732951549.836074294] [talker]: Publishing: 'Hello World: 2'
[INFO] [1732951550.834373071] [talker]: Publishing: 'Hello World: 3'
[INFO] [1732951551.833693585] [talker]: Publishing: 'Hello World: 4'
[INFO] [1732951552.832496922] [talker]: Publishing: 'Hello World: 5'
[INFO] [1732951553.837428390] [talker]: Publishing: 'Hello World: 6'
[INFO] [1732951554.837625417] [talker]: Publishing: 'Hello World: 7'
[INFO] [1732951555.832116744] [talker]: Publishing: 'Hello World: 8'
[INFO] [1732951556.832694909] [talker]: Publishing: 'Hello World: 9'
ros2 run demo_nodes_py listener[INFO] [1732951557.835554835] [talker]: Publishing: 'Hello World: 10'
ros2 run demo_nodes_py listener
[INFO] [1732951558.837004571] [talker]: Publishing: 'Hello World: 11'
[INFO] [1732951559.833874335] [talker]: Publishing: 'Hello World: 12'
[INFO] [1732951559.866716699] [listener]: I heard: [Hello World: 12]
[INFO] [1732951560.833103646] [talker]: Publishing: 'Hello World: 13'
[INFO] [1732951560.836635626] [listener]: I heard: [Hello World: 13]
[INFO] [1732951561.837261611] [talker]: Publishing: 'Hello World: 14'
[INFO] [1732951561.840662095] [listener]: I heard: [Hello World: 14]
[INFO] [1732951562.837272870] [talker]: Publishing: 'Hello World: 15'
[INFO] [1732951562.839853712] [listener]: I heard: [Hello World: 15]
[INFO] [1732951563.837317218] [talker]: Publishing: 'Hello World: 16'
[INFO] [1732951563.840274799] [listener]: I heard: [Hello World: 16]
^Croot@99a26e6e8a24:/work/ubuntu-ros2-dev# [INFO] [1732951564.837346196] [talker]: Publishing: 'Hello World: 17'
ps
    PID TTY          TIME CMD
      1 pts/0    00:00:00 bash
 269847 pts/0    00:00:00 ros2
 269850 pts/0    00:00:00 talker
 269890 pts/0    00:00:00 ps
root@99a26e6e8a24:/work/ubuntu-ros2-dev# [INFO] [1732951565.836178840] [talker]: Publishing: 'Hello World: 18'
  ```

