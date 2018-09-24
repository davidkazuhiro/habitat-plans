pkg_name=bird
pkg_origin=davidkazuhiro
pkg_version="1.6.4"
pkg_maintainer="David Somers-Harris <david@somers-harris.com>"
pkg_license=("Apache-2.0")
pkg_source="ftp://bird.network.cz/pub/${pkg_name}/${pkg_name}-${pkg_version}.tar.gz"
pkg_filename="${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="c26b8caae988dba81a9dbbee93502463d4326d1b749d728d62aa5529c605afc0"
pkg_deps=(core/glibc)
pkg_build_deps=(
  core/make
  core/gcc
  core/flex
  core/bison
  core/m4
)
pkg_svc_run="bird -f -u hab -g hab -c $pkg_svc_config_path/bird.conf"
pkg_bin_dirs=(sbin)
pkg_svc_user=root
pkg_svc_group=$pkg_svc_user
pkg_description="BIRD Internet Routing Daemon"
pkg_upstream_url="https://bird.network.cz/"

do_build() {
  ./configure --prefix=$pkg_prefix \
              --disable-client
  make
}
