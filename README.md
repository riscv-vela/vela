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

**riscv-vela.yml** will build `core-image-minimal`, you can then boot it with:

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
