function setproxy
set -Ux HTTPS_PROXY $argv
set -Ux HTTP_PROXY $HTTPS_PROXY
set -Ux ALL_PROXY $HTTPS_PROXY
end
