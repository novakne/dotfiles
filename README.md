# Dotfiles

*Dotfiles managed with [dotbot](https://github.com/anishathalye/dotbot)*

## Infos


* `OS_` Arch Linux
* `WM_` [Dwl](https://github.com/djpohly/dwl), [River](https://github.com/ifreund/river), [Sway](https://github.com/swaywm/sway)
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

### File structure

**$HOME/.zshenv** - Defines xdg environment and zsh directory

**$HOME/.config/zsh/**
* **completions/** - User auto completions for some cli tools
* **config/** - Zsh settings
* **functions/** - Load functions only when you call them
    * `br` Open images dir with sxiv `(e.g. br path/)`
    * `cl` Cd to a dir and list files with `exa`
    * `extract` Extract archives
    * `fapps` _fzf_ Open apps
    * `fcd` _fzf_ Interactive `cd`
    * `fcdh` _fzf_ Interactive `cd` with hidden files
    * `fe` _fzf_ Open file in default editor
    * `fimg` _fzf_ Open images in `sxiv`
    * `fkill` _fzf_ Kill processes
    * `fpkg` _fzf_ Search installed packages
    * `frg` _fzf_ Fuzzy grep with `ripgrep` and open in default editor
    * `fvid` _fzf_ Open videos in `mpv`
    * `h-glob` Help for zsh glob
    * `man` Colored man pages
    * `mcd` mkdir and cd to new dir
    * `n` `nnn` cd on quit with `Ctl-g`
    * `up` Go up N dir `(e.g. up 2)`
    * `zn` Jump to a directory with `zoxide` and open it in `neovim`
* **plugins/** - Personnal colors, zinit dir, dircolors and starship config
* **prompt/** - Own prompt for when I don't use starship

### Plugins

Prompt_ [Starship](https://github.com/starship/starship)

Lazy loaded with [Zinit](https://github.com/zdharma/zinit)

* [fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting)
* [Forgit](https://github.com/wfxr/forgit)
* [zsh-async](https://github.com/mafredri/zsh-async)
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
* [zsh-completions](https://github.com/zsh-users/zsh-completions)

### Cli Tools

* [bat](https://github.com/sharkdp/bat) - A cat clone with wings
* [bottom](https://github.com/ClementTsang/bottom) - A cross-platform graphical process/system monitor with a customizable interface and a multitude of features.
* [delta](https://github.com/dandavison/delta) - A viewer for git and diff output
* [dust](https://github.com/bootandy/dust) - du + rust = dust. Like du but more intuitive.
* [exa](https://github.com/ogham/exa) - A modern version of ls
* [fd](https://github.com/sharkdp/fd) - A simple, fast and user-friendly alternative to 'find'
* [fzf](https://github.com/junegunn/fzf) - Cli fuzzy finder
* [procs](https://github.com/dalance/procs) - procs is a replacement for ps written in Rust.
* [ripgrep](https://github.com/BurntSushi/ripgrep) - Recursively searches directories for a regex pattern
* [sd](https://github.com/chmln/sd) - sd is an intuitive find & replace CLI.
* [zoxide](https://github.com/ajeetdsouza/zoxide) -A faster way to navigate your filesystem 

### User scripts 

**$HOME/.local/bin/**

* **app/** - appimage
* **bat/** - [bat-extras](https://github.com/eth-p/bat-extras)
* **colors/** - Scripts to show colors in the terminal
* **trash/** - [trash-cli](https://github.com/andreafrancia/trash-cli)
* `dmenu-desktop` Open .desktop in dmenu
* `dmenu-power` Power menu in dmenu
* `extract` Extract archive
* `fetch` Show basic system infos
* `git-lg` Better git log
* `git-st` Better git status
* `lowercase-space` Change to lowercase and add space
* `mdpdf` Convert markdown to pdf with [Pandoc](https://github.com/jgm/pandoc)
* `new-mail` Run `isync` and `notmuch`
* `nnn-dl` Download new release of `nnn`
* `noti-brightness` Send a notification when changing screen brightness
* `nightly-nvim` Download nvim nightly appimage and put it in $PATH
* `pkg-list` List installed packages ( *all or explicitly or manually* )
* `rm_shit.py` Remove some trash in $HOME
* `rofi-power_menu` Open a exit menu in `rofi`
* `snap` Take screenshot with maim & slop or grim & slurp
* `sxhkd-key` Show `sxkhd` mappings in `fzf`
* `update-mirror` Get a list of fastest French mirror
* `update-sunneko` Update lua LSP
* `wayland-env` Wayland environment variables
