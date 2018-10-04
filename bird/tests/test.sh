#!/bin/sh
TESTDIR="$(dirname "${0}")"
PLANDIR="$(dirname "${TESTDIR}")"
SKIPBUILD=${SKIPBUILD:-0}

#hab pkg install core/busybox-static
#hab pkg binlink core/busybox-static netstat

hab pkg install --binlink core/bats
source "${PLANDIR}/plan.sh"

if [ "${SKIPBUILD}" -eq 0 ]; then
  set -e
  pushd "${PLANDIR}" > /dev/null
  build
  source results/last_build.env
  # Unload the service if its already loaded.
  hab svc unload "${HAB_ORIGIN}/${pkg_name}"
  hab pkg install --binlink --force "results/${pkg_artifact}"
  hab svc load "${pkg_ident}"
  popd > /dev/null
  set +e
fi

bats "${TESTDIR}/test.bats"
