function mgrun --wraps='mangohud gamemoderun' --description 'alias mgrun=mangohud gamemoderun'
  mangohud gamemoderun $argv; 
end

complete --exclusive mgrun -a '(__fish_complete_subcommand)' -n 'not __fish_seen_argument -s e'
