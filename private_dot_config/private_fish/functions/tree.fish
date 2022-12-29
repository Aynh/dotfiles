function tree --wraps=br
br --height (math (stty size | cut -d' ' -f1) - 2) --cmd :print_tree $argv
end
