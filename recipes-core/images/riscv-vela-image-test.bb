LICENSE = "MIT"

require riscv-vela-image-core.bb

IMAGE_INSTALL:append = " \
    gdb \
"
