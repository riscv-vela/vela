# Requirements

Install required packages with following commands.

```
sudo apt update
sudo apt install opensbi qemu-system-misc u-boot-qemu
```

# Preparing ubuntu image

Execute init.sh for preparing ubuntu image.

```
./init.sh
```
# Running QEMU

Execute run.sh for running qemu.

```
./run.sh
```

Login with the user ubuntu and the default password ubuntu.
You will be asked to choose a new password at first boot.

Port 2222 of localhost is forwarded to port 22 (ssh) of virtual machine.

```
ssh -p 2222 ubuntu@localhost
```
