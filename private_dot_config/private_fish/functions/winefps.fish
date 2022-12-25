function winefps --wraps=wine
WINEDEBUG=fps wine $argv 2>| tee /dev/stderr | sed -nu '/trace:fps:/{s/.* \([^ ]*\)fps/\1/;p}' | osd_cat -l1 -f "-*-fira code-bold-*-*-*-17-120-100-100-*-*-*-uni" -O1 -c "yellow";
end
