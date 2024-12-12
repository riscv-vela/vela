SUMMARY = "Basic core image."

IMAGE_FEATURES += "debug-tweaks"

LICENSE = "MIT"

inherit core-image

IMAGE_INSTALL:append = " \
    gdb \
"
