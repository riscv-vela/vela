1.      구축 환경

1.      ubuntu-16.04

2.      freedom-u-sdk 빌드

1.      git clone

1.      git clone https://github.com/sifive/freedom-u-sdk
2.      cd freedom-u-sdk
3.      git checkout linux_u500vc707devkit_config
4.      git rm riscv-qemu
5.      git submodule sync --recursive
6.      git submodule update --recursive --init
7.      에러 발생시 : fatal: clone of 'git://github.com/riscv/riscv-
qemu.git' into submodule path 'riscv-qemu' failed

1.      cd riscv-gnu-toolchain
2.      git rm riscv-qemu -f
3.      git submodule sync --recursive

2.      빌드

1.      unset RISCV
2.      make -j4 BOARD=vc707devkit

3.      부팅 이미지 위치

1.      work/riscv-pk/bbl
2.      work/bbl.bin

4.      rootfs 위치

1.      work/buildroot_initramfs_sysroot

3.      spike (ISA simulator) 빌드

1.      cd riscv-isa-sim
2.      git checkout v1.0.0
3.      mkdir build
4.      cd build
5.      export RISCV={freedom-u-sdk}/toolchain
6.      ../configure --prefix=$RISCV
7.      make -j4

4.      linux/spike 실행

1.      riscv-isa-sim/build/spike  work/riscv-pk/bbl
2.      id/passwd : root/sifive







dkang:build$ ./spike ../../../freedom-u-sdk/work/riscv-pk/bbl

bbl loader



                SIFIVE, INC.



         5555555555555555555555555

        5555                   5555

       5555                     5555

      5555                       5555

     5555       5555555555555555555555

    5555       555555555555555555555555

   5555                             5555

  5555                               5555

5555                                 5555

5555555555555555555555555555          55555

55555           555555555           55555

   55555           55555           55555

     55555           5           55555

       55555                   55555

         55555               55555

           55555           55555

             55555       55555

               55555   55555

                 555555555

                   55555

                     5



           SiFive RISC-V Coreplex

[    0.000000] OF: fdt: Ignoring memory range 0x80000000 - 0x80200000

[    0.000000] Linux version 4.15.0-00047-g2751b6a (dkang@ubuntu1604) (gcc
version 7.2.0 (GCC)) #2 SMP Tue May 30 09:37:20 KST 2023

[    0.000000] bootconsole [early0] enabled

[    0.000000] Initial ramdisk at: 0x        (ptrval) (9436160 bytes)

[    0.000000] Zone ranges:

[    0.000000]   DMA32    [mem 0x0000000080200000-0x00000000ffffffff]

[    0.000000]   Normal   [mem 0x0000000100000000-0x00000fffffffffff]

[    0.000000] Movable zone start for each node

[    0.000000] Early memory node ranges

[    0.000000]   node   0: [mem 0x0000000080200000-0x00000000ffffffff]

[    0.000000] Initmem setup node 0 [mem 0x0000000080200000-
0x00000000ffffffff]

[    0.000000] software IO TLB [mem 0xfa3fe000-0xfe3fe000] (64MB) mapped at
[        (ptrval)-        (ptrval)]

[    0.000000] elf_hwcap is 0x112d

[    0.000000] percpu: Embedded 14 pages/cpu @        (ptrval) s28632 r0
d28712 u57344

[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 516615

[    0.000000] Kernel command line:

[    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152
bytes)

[    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576
bytes)

[    0.000000] Sorting __ex_table...

[    0.000000] Memory: 1983192K/2095104K available (2988K kernel code, 201K
rwdata, 793K rodata, 9371K init, 779K bss, 111912K reserved, 0K cma-
reserved)

[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1

[    0.000000] Hierarchical RCU implementation.

[    0.000000]  RCU event tracing is enabled.

[    0.000000]  RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=1.

[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1

[    0.000000] NR_IRQS: 0, nr_irqs: 0, preallocated irqs: 0

[    0.000000] riscv,cpu_intc,0: 64 local interrupts mapped

[    0.000000] clocksource: riscv_clocksource: mask: 0xffffffffffffffff
max_cycles: 0x24e6a1710, max_idle_ns: 440795202120 ns

[    0.000005] sched_clock: 64 bits at 10MHz, resolution 100ns, wraps every
4398046511100ns

[    0.000490] console [hvc0] enabled

[    0.000490] console [hvc0] enabled

[    0.000885] bootconsole [early0] disabled

[    0.000885] bootconsole [early0] disabled

[    0.001355] Calibrating delay loop (skipped), value calculated using
timer frequency.. 20.00 BogoMIPS (lpj=100000)

[    0.001960] pid_max: default: 32768 minimum: 301

[    0.002290] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)

[    0.002685] Mountpoint-cache hash table entries: 4096 (order: 3, 32768
bytes)

[    0.003665] Hierarchical SRCU implementation.

[    0.004735] smp: Bringing up secondary CPUs ...

[    0.005000] smp: Brought up 1 node, 1 CPU

[    0.005420] devtmpfs: initialized

[    0.005890] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 19112604462750000 ns

[    0.006460] futex hash table entries: 256 (order: 2, 16384 bytes)

[    0.006905] random: get_random_u32 called from
bucket_table_alloc+0xe6/0x276 with crng_init=0

[    0.007465] NET: Registered protocol family 16

[    0.009840] vgaarb: loaded

[    0.010125] SCSI subsystem initialized

[    0.010455] usbcore: registered new interface driver usbfs

[    0.010820] usbcore: registered new interface driver hub

[    0.011145] usbcore: registered new device driver usb

[    0.011470] pps_core: LinuxPPS API ver. 1 registered

[    0.011760] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo
Giometti <giometti@linux.it>

[    0.012295] PTP clock support registered

[    0.012700] clocksource: Switched to clocksource riscv_clocksource

[    0.013500] NET: Registered protocol family 2

[    0.014030] TCP established hash table entries: 16384 (order: 5, 131072
bytes)

[    0.014650] TCP bind hash table entries: 16384 (order: 6, 262144 bytes)

[    0.015230] TCP: Hash tables configured (established 16384 bind 16384)

[    0.015640] UDP hash table entries: 1024 (order: 3, 32768 bytes)

[    0.016025] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes)

[    0.016475] NET: Registered protocol family 1

[    0.038745] Unpacking initramfs...

[    0.064870] Initialise system trusted keyrings

[    0.065195] workingset: timestamp_bits=62 max_order=19 bucket_order=0

[    0.069155] random: fast init done

[    0.076090] jitterentropy: Initialization failed with host not compliant
with requirements: 2

[    0.076585] Key type asymmetric registered

[    0.076825] Asymmetric key parser 'x509' registered

[    0.077115] io scheduler noop registered

[    0.077445] io scheduler cfq registered (default)

[    0.077720] io scheduler mq-deadline registered

[    0.077985] io scheduler kyber registered

[    0.097415] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled

[    0.098235] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k

[    0.098575] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.

[    0.098945] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver

[    0.099325] ehci-pci: EHCI PCI platform driver

[    0.099620] usbcore: registered new interface driver usb-storage

[    0.100010] usbcore: registered new interface driver usbhid

[    0.100335] usbhid: USB HID core driver

[    0.100650] NET: Registered protocol family 17

[    0.101065] Loading compiled-in X.509 certificates

[    0.103755] Freeing unused kernel memory: 9368K

[    0.104020] This architecture does not have kernel memory protection.

Starting logging: OK

Starting mdev...

modprobe: can't change directory to '/lib/modules': No such file or
directory

Initializing random number generator... done.

Starting network...

Waiting for interface eth0 to appear............... timeout!

run-parts: /etc/network/if-pre-up.d/wait_iface: exit status 1

Starting dropbear sshd: OK



Welcome to Buildroot

buildroot login: root

root

Password: sifive



# pwd



pwd

/root

#


