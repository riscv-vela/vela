# SiFive Freedom Unleashed SDK

This builds a complete RISC-V cross-compile toolchain and RISC-V Linux image (buildroot) for the SiFive Freedom
Unleashed U500 SoC in a Docker image due to the SDK having issues compiling with different Ubuntu/Debian installations.


# Usage / Installation #


 ```
make
```
 
Or if you want to compile RISC-V Linux (buildroot / busybox) and simulate it in a QEMU VM

 ```
make qemu
```

