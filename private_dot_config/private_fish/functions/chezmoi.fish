function chezmoi
set chezmoi (which chezmoi)
if test "$argv" = "cd"
cd ($chezmoi source-path)
else
$chezmoi $argv
end
end
