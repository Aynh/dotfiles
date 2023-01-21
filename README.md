# dotfiles

- [Custom .desktop files (overrides)](#custom-desktop-files-overrides)
- [Fish functions](#fish-functions)
  - [chezmoi.fish](#chezmoifish)
  - [cp.fish, mv.fish](#cpfish-mvfish)
  - [noproxy.fish](#noproxyfish)
  - [setproxy.fish](#setproxyfish)
  - [tree.fish](#treefish)
  - [winefps.fish](#winefpsfish)
  - [ytmpv.fish](#ytmpvfish)
  - [Aliases](#aliases)
- [pacman/AUR pkglist](#pacmanaur-pkglist)
- [~/.local/bin](#localbin)

## Custom [.desktop files](./private_dot_local/private_share/applications) (overrides)

| Name                                                                              | Difference with builtin               |
| --------------------------------------------------------------------------------- | ------------------------------------- |
| [Chromium](./private_dot_local/private_share/applications/chromium.desktop)       | Run chromium with $ALL_PROXY as proxy |
| [Discord PTB](./private_dot_local/private_share/applications/discord-ptb.desktop) | Same as `Chromium`                    |
| [Steam (Runtime)](./private_dot_local/private_share/applications/steam.desktop)   | Run steam with `gamemoderun`          |

## [Fish functions](./private_dot_config/private_fish/functions)

### [chezmoi.fish](./chezmoi.private_dot_config/private_fish/functions/chezmoi.fish)

Simply to `chezmoi cd` without spawning additional fish process.

### [cp.fish](./private_dot_config/private_fish/functions/cp.fish), [mv.fish](./private_dot_config/private_fish/functions/mv.fish)

Basically cp, mv with `--interactive`.

### [noproxy.fish](private_dot_config/private_fish/functions/noproxy.fish)

Runs a command without _any_ proxy.

### [setproxy.fish](private_dot_config/private_fish/functions/setproxy.fish)

Sets all variant of proxies.

### [tree.fish](private_dot_config/private_fish/functions/tree.fish)

A prettier `tree` using [`broot`](https://dystroy.org/broot).

### [winefps.fish](private_dot_config/private_fish/functions/winefps.fish)

Runs `wine` and show fps using `osd_cat` (it uses fira code font).

### [ytmpv.fish](private_dot_config/private_fish/functions/ytmpv.fish)

Streams [`yt-dlp`](https://github.com/yt-dlp/yt-dlp) compatible url, caches them into `~/.mpv-cache`, and then plays them with [`mpv`](https://mpv.io).

You can use `--help`, `-F`, and `-f` `yt-dlp` flag on this function. `-f` (read: stream format) defaults to 18 (360p) if you don't specify any (don't ask me why).

### Aliases

| Command                                                            | Alias of               |
| ------------------------------------------------------------------ | ---------------------- |
| [g.fish](./private_dot_config/private_fish/functions/g.fish)       | `git`                  |
| [mgrun.fish](private_dot_config/private_fish/functions/mgrun.fish) | `mangohud gamemoderun` |

## [pacman](./pkglist.txt)/[AUR](./pkglist_aur.txt) pkglist

Generated with `pacman -Qqen > pkglist.txt; pacman -Qqem > pkglist_aur.txt`

## [~/.local/bin](./private_dot_local/bin)

- [winefps](./private_dot_local/bin/executable_winefps), alias to `winefps` function defined in [fish](#winefpsfish).
