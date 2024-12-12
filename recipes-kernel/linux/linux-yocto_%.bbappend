FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:qemuriscv64 = " \
    file://riscv-vela.cfg \
"

do_configure:append:qemuriscv64() {
    ${S}/scripts/kconfig/merge_config.sh -m .config ${WORKDIR}/riscv-vela.cfg
}
