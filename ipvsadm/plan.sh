pkg_name=ipvsadm
pkg_origin=davidkazuhiro
pkg_version="1.29"
pkg_maintainer="David Somers-Harris <david@somers-harris.com>"
pkg_license=("Apache-2.0")
pkg_source="https://mirrors.edge.kernel.org/pub/linux/utils/kernel/${pkg_name}/${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="297f5cd459c3eef81ed0ca32e53bf320ed6b132fe7ed6ea5e44aa6b1fbd2a7de"
pkg_build_deps=(
  core/gcc
  core/make
  core/patch
  core/pkg-config
  core/popt
  core/which
  davidkazuhiro/libnl
)
pkg_deps=(
  core/popt
  davidkazuhiro/libnl
)
pkg_bin_dirs=(sbin)
pkg_description="Ipvsadm is  used  to set up, maintain or inspect the virtual server table in the Linux kernel."
pkg_upstream_url="http://kb.linuxvirtualserver.org/wiki/Ipvsadm"

do_setup_environment() {
  set_buildtime_env BUILD_ROOT ${pkg_prefix}
}

do_build() {
  patch Makefile $PLAN_CONTEXT/makefile.patch
  make
}
