source "${BATS_TEST_DIRNAME}/../plan.sh"

@test "Command is on path" {
  [ "$(command -v ipvsadm)" ]
}

@test "Version matches" {
  result="$(ipvsadm -v 2>&1 | awk '{print $2}' | \
          cut -c 2-)"
  [ "$result" = "${pkg_version}" ]
}

@test "Service is running" {
  echo -e "$(hab svc status)"
  [ "$(hab svc status | grep "ipvsadm\.default" | awk '{print $4}' | grep up)" ]
}

#@test "Listening on port 80" {
#  result="$(netstat -peanut | grep haproxy | awk '{print $4}' | awk -F':' '{print $2}')"
#  [ "${result}" -eq 80 ]
#}
