
- [Dotfiles](#dotfiles)
  * [Infos](#infos)
    + [Applications](#applications)
  * [Screenshots](#screenshots)
  * [Shell](#shell)
    + [File structure](#file-structure)
      - [Global](#global)
      - [Bash](#bash)
      - [Zsh](#zsh)
    + [Cli tools](#cli-tools)
    + [User scripts](#user-scripts)

# Dotfiles

*Dotfiles managed with [dotbot](https://github.com/anishathalye/dotbot)*

## Infos


* `OS_` Arch Linux
* `WM_` [Dwl](https://github.com/djpohly/dwl), [River](https://github.com/ifreund/river)
* `Shell_` Zsh

### Applications

* `Aur helper_` [paru](https://github.com/Morganamilo/paru)
* `Browser_` Firefox
* `Editor_` [Neovim 5.x](https://github.com/neovim/neovim) ( *prerelease build* )
* `Files manager_` [Nnn](https://github.com/jarun/nnn) ( *build with nerd icons* )
* `Launcher_` [dmenu-wl](https://github.com/nyyManni/dmenu-wayland)
* `Mail_`
  * [afew](https://github.com/afewmail/afew)
  * [alot](https://github.com/pazz/alot)
  * [isync](https://isync.sourceforge.io/)
  * [notmuch](https://notmuchmail.org/)
* `Media_`
  * `Image_` [imv](https://github.com/eXeC64/imv)
  * `Music_` Mpd / Ncmpcpp / Spotify
  * `Video_` [Mpv](https://github.com/mpv-player/mpv)
  * `Pdf_` [Zathura](https://pwmt.org/projects/zathura/)
* `Notification_` [Fnott](https://codeberg.org/dnkl/fnott)
* `Rss_` [Newsboat](https://newsboat.org/)
* `Screenshot_`
  * [Grim](https://github.com/emersion/grim)
  * [Slurp](https://github.com/emersion/slurp)
* `Terminal_`
  * [Foot](https://codeberg.org/dnkl/foot)
  * [Alacritty](https://github.com/jwilm/alacritty)

* `Fonts_`
  * `System_`
    * [Overpass](https://overpassfont.org/)
    * [Inter](https://github.com/rsms/inter)
  * `Terminal_` [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts)
* `Theme_`
  * `Icons_` [Arc](https://github.com/horst3180/arc-icon-theme)
  * `Gtk_` [Arc](https://github.com/horst3180/arc-theme)

## Screenshots

( **WIP** )

## Shell

Prompt_ [Starship](https://github.com/starship/starship)

### File structure

#### Global

**$HOME/.config/shell/** - Common config for `bash` and `zsh`
* **environment/** - Environment variables
    * `10-user`         - User bin & co
    * `20-plugins`      - Variables for shell plugins
    * `30-cli`          - Variables for cli programm
    * `40-programming`  - Variables for programming language
* **functions/**
    * `cl`       - Cd to a dir and list files with `exa` or `ls`
    * `fapps`    - Open apps [_fzf_]
    * `fcd`      - Interactive `cd` [_fzf_]
    * `fcdb`     - Interactive `cd` to parent directory [_fzf_]
    * `fe`       - Open file in default editor [_fzf_]
    * `fimg`     - Open images in `sxiv` [_fzf_]
    * `fin`      - Install pkg with `paru` [_fzf_]
    * `fkill`    - Kill processes [_fzf_]
    * `fpkg`     - Search installed packages [_fzf_]
    * `fre`      - Remove pkg with `paru` [_fzf_]
    * `frg`      - Fuzzy grep with `ripgrep` and open in default editor [_fzf_]
    * `ft`       - Search ctags [_fzf_]
    * `ftag`     - Search ctags generated with `--excmd=number` [_fzf_]
    * `fvid`     - Open videos in `mpv` [_fzf_]
    * `hglob`    - Help for zsh glob
    * `mcd`      - mkdir and cd to new dir
    * `n`        - `nnn` cd on quit
    * `up`       - Go up N dir `(e.g. up 2)`
    * `zn`       - Jump to a directory with `zoxide` and open it in `neovim`
* **plugins/** - Personnal colors, dircolors, osc7 and starship config
* *aliases* - Shell aliases
* *env-global* - Environment for login shell


#### Bash

**$HOME/**
* *.bash_logout*
* *.bash_profile*  - Login shell
* *.bashrc*        - Everything

#### Zsh

**$HOME/**
* *.zshenv* - Login shell

**$HOME/.config/zsh/**
* **completions/** - User auto completions for some cli tools
* **plugins/**
    * **zinit/** - Zinit plugins directories 
* *.zlogin*    - Post .zshrc
* *.zprofile*  - Login pre .zshrc
* *.zshrc*     - Everything

Lazy loaded with [Zinit](https://github.com/zdharma/zinit)

* [fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting)
* [forgit](https://github.com/wfxr/forgit)
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
* [zsh-completions](https://github.com/zsh-users/zsh-completions)

### Cli tools

* [bat](https://github.com/sharkdp/bat)             - A cat clone with wings
* [bottom](https://github.com/ClementTsang/bottom)  - A cross-platform graphical process/system monitor
* [delta](https://github.com/dandavison/delta)      - A viewer for git and diff output
* [dust](https://github.com/bootandy/dust)          - du + rust = dust. Like du but more intuitive
* [exa](https://github.com/ogham/exa)               - A modern version of ls
* [fd](https://github.com/sharkdp/fd)               - A simple, fast and user-friendly alternative to 'find'
* [fzf](https://github.com/junegunn/fzf)            - Cli fuzzy finder
* [procs](https://github.com/dalance/procs)         - procs is a replacement for ps written in Rust
* [ripgrep](https://github.com/BurntSushi/ripgrep)  - Recursively searches directories for a regex pattern
* [sd](https://github.com/chmln/sd)                 - sd is an intuitive find & replace CLI
* [zoxide](https://github.com/ajeetdsouza/zoxide)   - A faster way to navigate your filesystem

### User scripts 

**$HOME/.local/bin/**

* **app/**     - appimage or compiled
* **colors/**  - Scripts to show colors in the terminal
* `dmenu-desktop`    - Open .desktop in dmenu-wl
* `dmenu-power`      - Power menu in dmenu-wl
* `dmenu-run`        - Launch dmenu-wl
* `dwl-start`        - Script to use at dwl launch
* `extract`          - Extract archive
* `fetch`            - Show basic system infos
* `git-lg`           - Better git log
* `git-st`           - Better git status
* `lowercase-space`  - Change to lowercase and add space
* `mdpdf`            - Convert markdown to pdf with [Pandoc](https://github.com/jgm/pandoc)
* `new-mail`         - Run `isync` and `notmuch`
* `nightly-nvim`     - Download nvim nightly appimage and put it in $PATH
* `pkg-list`         - List installed packages ( *all or explicitly or manually* )
* `rmshit.py`        - Remove some trash in $HOME
* `rofi-power_menu`  - Open a exit menu in `rofi`
* `snap`             - Take screenshot with maim & slop or grim & slurp
* `sxhkd-key`        - Show `sxkhd` mappings in `fzf`
* `update-fzf`       - Update fzf local repo
* `update-mirror`    - Get a list of fastest French mirror
* `update-sunneko`   - Update lua LSP
* `wayland-env`      - Wayland environment variables
