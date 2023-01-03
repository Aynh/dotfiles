function noproxy
  ALL_PROXY= HTTP_PROXY= HTTPS_PROXY= $argv
end

complete --exclusive noproxy -a '(__fish_complete_subcommand)' -n 'not __fish_seen_argument -s e'
