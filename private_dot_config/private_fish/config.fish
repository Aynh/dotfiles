if status is-interactive
end

zoxide init fish | source
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# THEME PURE #
set fish_function_path /home/yasser/.config/fish/functions/theme-pure/functions/ $fish_function_path
source /home/yasser/.config/fish/functions/theme-pure/conf.d/pure.fish
