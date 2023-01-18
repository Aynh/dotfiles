function ytmpv
  argparse 'h/help' 'F' 'f/format=' -- $argv
  or return

  if set -ql _flag_help
  functions yt
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

  set filename (echo -n "$argv" | cksum)
  yt-dlp \
  --ignore-config \
  --limit-rate 500K \
  --format $_flag_format \
  --output - \
  -- "$argv" \
  | tee "$HOME/.mpv-cache/$filename" \
  | mpv -
end
