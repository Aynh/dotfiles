function setproxy
  set -Ux HTTPS_PROXY $argv
  set -Ux HTTP_PROXY $HTTPS_PROXY
  set -Ux ALL_PROXY $HTTPS_PROXY
end

complete --exclusive setproxy -a "(__fish_print_addresses)" -n "__fish_is_first_arg"
