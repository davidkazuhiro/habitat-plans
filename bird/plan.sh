pkg_name=bird
pkg_origin=davidkazuhiro
pkg_version="2.0.2"
pkg_maintainer="David Somers-Harris <david@somers-harris.com>"
pkg_license=("Apache-2.0")
pkg_source="https://github.com/BIRD/bird/archive/v${pkg_version}.tar.gz"
pkg_filename="${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="bd42d48fbcc2c0046d544f1183cd98193ff15b792d332ff45f386b0180b09335"
pkg_deps=(core/glibc)
pkg_build_deps=(
  core/autoconf
  core/bison
  core/flex
  core/gcc
  #core/m4
  core/make
  core/ncurses
  core/readline
)
pkg_svc_run="bird -f -u hab -g hab -c $pkg_svc_config_path/bird.conf"
pkg_bin_dirs=(sbin)
pkg_svc_user=root
pkg_svc_group=$pkg_svc_user
pkg_description="BIRD Internet Routing Daemon"
pkg_upstream_url="https://bird.network.cz/"

do_build() {
  autoreconf
  ./configure --prefix=${pkg_prefix}
  make
}
