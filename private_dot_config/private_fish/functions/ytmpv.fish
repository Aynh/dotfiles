function ytmpv
  argparse 'h/help' 'F' 'f/format=' -- $argv
  or return

  if set -ql _flag_help
    yt-dlp --help
    return
  end

  argparse --min-args 1 -- $argv
  or return

  if set -ql _flag_F
    yt-dlp --list-formats "$argv"
    return
  end

  # set default format to 18 (360p)
  set -q _flag_format || set _flag_format 18
  
  # set (cache) filename to crc32 of $argv suffixed with format
  set filename "$(echo -n "$argv" | cksum | cut -d ' ' -f 1)-$_flag_format"
  mkdir -p "$HOME/.mpv-cache"
  yt-dlp \
    --ignore-config \
    --limit-rate 500K \
    --format $_flag_format \
    --output - \
    -- "$argv" \
    | tee "$HOME/.mpv-cache/$filename" \
    | mpv -
end
