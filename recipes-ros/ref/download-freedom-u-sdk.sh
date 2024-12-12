# download source
git clone https://github.com/sifive/freedom-u-sdk.git
cd freedom-u-sdk

# target tree chagne
git checkout linux_u500vc707devkit_config

# add changed url
git config --global url.https://gitlab.com/qemu-project/.insteadOf git://git.qemu-project.org/
git config --global url.https://git.qemu.org/git/.insteadOf git://git.qemu.org/
git config --global url.https://anongit.freedesktop.org/git/.insteadOf git://anongit.freedesktop.org/
git config --global url.https://github.com/riscv.insteadOf git://github.com/riscv
git config --global url.https://github.com/.insteadOf git://github.com/

# sync 
git submodule sync --recursive
git submodule update --recursive --init

# recover url
git config --global --unset url.https://github.com/.insteadOf

