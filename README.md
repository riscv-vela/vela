# meta-riscv-vela

RISC-V Vela Layer for OpenEmbedded/Yocto

## Description

More information can be found at: <https://github.com/riscv-vela/> (Official Site)

## Quick Start

### Kas Support

Kas build is supported, you can run the following commands:

```text
git clone https://github.com/riscv-vela/meta-riscv-vela.git
cd meta-riscv-vela
```

* For basic `qemuriscv64` build run:

```text
kas build kas/riscv-vela.yml
```

**base-riscv.yml** will build `core-image-minimal`, you can then boot it with:

```text
runqemu core-image-minimal nographic
```

**NOTE** `nographic` is needed for this image, because it has no graphical support for graphical Qemu run.

