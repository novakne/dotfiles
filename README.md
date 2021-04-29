# Dotfiles

_Dotfiles managed with [dotbot](https://github.com/anishathalye/dotbot)_

## Infos

- _OS_ . Void Linux ( _see arch branch too_ )
- _WM_ . [river](https://github.com/ifreund/river) . [dwl](https://github.com/djpohly/dwl)
- _Shell_ . zsh

### Applications

- _Browser_ . firefox
- _Bar_ . [yambar](https://codeberg.org/dnkl/yambar)
- _Editor_ . [neovim 5.x](https://github.com/neovim/neovim) ( _prerelease build_ )
- _Files manager_ . [nnn](https://github.com/jarun/nnn) ( _build with nerd icons_ )
- _Launcher_
  . [dmenu-wl](https://github.com/nyyManni/dmenu-wayland)
  . [fuzzel](https://codeberg.org/dnkl/fuzzel)
- _Mail_ . [aerc](https://git.sr.ht/~sircmpwn/aerc)
- _Media_
  - _Image_ . [imv](https://github.com/eXeC64/imv)
  - _Music_ . [spotifyd](https://github.com/Spotifyd/spotifyd) . [spotify-tui](https://github.com/Rigellute/spotify-tui)
  - _Video_ . [mpv](https://github.com/mpv-player/mpv)
  - _Pdf_ . [zathura](https://pwmt.org/projects/zathura/)
- _Notification_ . [fnott](https://codeberg.org/dnkl/fnott)
- _Rss_ . [newsboat](https://newsboat.org/)
- _Screenshot_
  . [grim](https://github.com/emersion/grim)
  . [slurp](https://github.com/emersion/slurp)
- _Terminal_ . [foot](https://codeberg.org/dnkl/foot)

- _Fonts_
  - _System_
    . [Overpass](https://overpassfont.org/)
    . [Inter](https://github.com/rsms/inter)
  - _Terminal_ . [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts)
- _Theme_
  - _Icons_ . [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
  - _Gtk_ . [Materia](https://github.com/nana-4/materia-theme)

## Screenshots

- _Wallpaper_: Amazing works by **[TONTON REVOLVER](https://www.artstation.com/artwork/xJAqkE)**

### River

<p align="center"><img src=".previews/river.png?raw=true "river""/></a></p>

## Shell

Prompt\_ [Starship](https://github.com/starship/starship)

### File structure

#### Global

**$HOME/.config/shell/** - Common config for `bash` and `zsh`

- **environment/** - Environment variables
  - `10-user` - User bin & co
  - `20-plugins` - Variables for shell plugins
  - `30-cli` - Variables for cli program
  - `40-programming` - Variables for programming language
- **functions/**
  - `cl` - Cd to a dir and list files with `exa` or `ls`
  - `fapp` - Open apps [ _fzf_ ]
  - `fcd` - Interactive `cd` [ _fzf_ ]
  - `fcdb` - Interactive `cd` to parent directory [ _fzf_ ]
  - `fe` - Open file in default editor [ _fzf_ ]
  - `fimg` - Open images in `sxiv` [ _fzf_ ]
  - `fin` - Install pkg with `paru` [ _fzf_ ]
  - `fkill` - Kill processes [ _fzf_ ]
  - `fman` - Search man pages [ _fzf_ ]
  - `fpkg` - Search installed packages [ _fzf_ ]
  - `fre` - Remove pkg with `paru` [ _fzf_ ]
  - `frg` - Fuzzy grep with `ripgrep` and open in default editor [ _fzf_ ]
  - `ft` - Search ctags [ _fzf_ ]
  - `ftag` - Search ctags generated with `--excmd=number` [ _fzf_ ]
  - `fvid` - Open videos in `mpv` [ _fzf_ ]
  - `hglob` - Help for zsh glob
  - `mcd` - mkdir and cd to new dir
  - `n` - `nnn` cd on quit
  - `nl` - Open file at given line in **nvim**
  - `rgv` - Search with ripgrep and open in nvim quicklist
  - `up` - Go up N dir `(e.g. up 2)`
  - `zn` - Jump to a directory with `zoxide` and open it in `neovim`
- **plugins/** - Personnal colors, dircolors, osc7 and starship config
- _aliases_ - Shell aliases
- _env-global_ - Environment for login shell

#### Bash

**$HOME/**

- _.bash_logout_
- _.bash_profile_ - Login shell
- _.bashrc_ - Everything

#### Zsh

**$HOME/**

- _.zshenv_ - Login shell

**$HOME/.config/zsh/**

- **completions/** - User auto completions for some cli tools
- **plugins/** - Submodules
  - [fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting)
  - [forgit](https://github.com/wfxr/forgit)
  - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
  - [zsh-completions](https://github.com/zsh-users/zsh-completions)
- _.zlogin_ - Post .zshrc
- _.zprofile_ - Login pre .zshrc
- _.zshrc_ - Everything

### Cli tools

- [bat](https://github.com/sharkdp/bat) - A cat clone with wings
- [bottom](https://github.com/ClementTsang/bottom) - A cross-platform graphical process/system monitor
- [delta](https://github.com/dandavison/delta) - A viewer for git and diff output
- [dust](https://github.com/bootandy/dust) - du + rust = dust. Like du but more intuitive
- [exa](https://github.com/ogham/exa) - A modern version of ls
- [fd](https://github.com/sharkdp/fd) - A simple, fast and user-friendly alternative to 'find'
- [fzf](https://github.com/junegunn/fzf) - Cli fuzzy finder
- [procs](https://github.com/dalance/procs) - procs is a replacement for ps written in Rust
- [ripgrep](https://github.com/BurntSushi/ripgrep) - Recursively searches directories for a regex pattern
- [sd](https://github.com/chmln/sd) - sd is an intuitive find & replace CLI
- [teeldear](https://github.com/dbrgn/tealdeer) - A very fast implementation of tldr in Rust
- [ugdb](https://github.com/ftilde/ugdb) - TUI for gdb
- [zoxide](https://github.com/ajeetdsouza/zoxide) - A faster way to navigate your filesystem

### User scripts

**$HOME/.local/bin/**

- **app/** - appimage or compiled
- **colors/** - Scripts to show colors in the terminal
- `bld-update` - Update differents repos
- `dmenu-desktop` - Open .desktop in **dmenu-wl**
- `dmenu-power` - Power menu in **dmenu-wl**
- `dmenu-run` - Launch **dmenu-wl**
- `dwl-autostart` - Script to use at **dwl** launch
- `dwl-run` - Launch **dwl**
- `extract` - Extract archive
- `fetch` - Show basic system infos
- `fnote` - Search for header in markdown files
- `foot-float` - Open a floating **foot** window in **river**
- `foot-light` - Launch a **foot** instance with light theme
- `fpass` - Fuzzy search paswords in **pass** and copy it
- `ftnote` - Search for `@tag` in markdown files
- `fuzzel-run` - Launch **fuzzel** with default args
- `git-lg` - Better git log
- `git-sfm` - Git switch/fetch/merge upstream
- `git-st` - Better git status
- `lowercase-space` - Change to lowercase and add space
- `mdpdf` - Convert markdown to pdf with [Pandoc](https://github.com/jgm/pandoc)
- `new-mail` - Run **isync** and **notmuch**
- `pkg-list` - List installed packages ( _all or explicitly or manually_ )
- `river-gaps` - Set gaps in **river**
- `river-run` - Launch **river**
- `rmshit.py` - Remove some trash in `$HOME`
- `rofi-power_menu` - Open a exit menu in **rofi**
- `snap` - Take screenshot with **maim** & **slop** or **grim** & **slurp**
- `sway-run` - Launch **sway**
- `sxhkd-key` - Show **sxkhd** mappings in **fzf**

