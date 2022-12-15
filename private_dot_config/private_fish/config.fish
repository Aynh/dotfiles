if status is-interactive
end

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

zoxide init fish | source
source (/usr/bin/starship init fish --print-full-init | psub)
