# Dotfiles

_Dotfiles managed with [dotbot](https://github.com/anishathalye/dotbot)_

## Infos

|      | Main | Others |
-------|------|--------|
__os__ | Void Linux | Arch Linux ( _see arch branch_ )
__wm__ | [river](https://github.com/ifreund/river) | [dwl](https://github.com/djpohly/dwl)

### Applications

__Browser__ . firefox

__Bar__ . [yambar](https://codeberg.org/dnkl/yambar)

__Editor__ . [neovim 5.x](https://github.com/neovim/neovim) ( _prerelease build_ )

__Files manager__ . [nnn](https://github.com/jarun/nnn) ( _build with nerd icons_ )

__Launcher__ . [fuzzel](https://codeberg.org/dnkl/fuzzel)

__Mail__ . [aerc](https://git.sr.ht/~sircmpwn/aerc)

__Media__
- _Image_ . [imv](https://github.com/eXeC64/imv)
- _Music_ . spotify
- _Video_ . [mpv](https://github.com/mpv-player/mpv)
- _Pdf_ . [zathura](https://pwmt.org/projects/zathura/)

__Notification__ . [fnott](https://codeberg.org/dnkl/fnott)

__Rss__ . [newsboat](https://newsboat.org/)

__Screenshot__ . [grim](https://github.com/emersion/grim) . [slurp](https://github.com/emersion/slurp)

__Terminal__ . [foot](https://codeberg.org/dnkl/foot)

__Fonts__
- _System_ . [Overpass](https://overpassfont.org/)
- _Terminal_ . [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts)

__Theme__
- _Icons_ . [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- _Gtk_ . [Materia](https://github.com/nana-4/materia-theme)

## Screenshots

### River

<p align="left"><img src="meta/previews/river-dark.png?raw=true "river dark""/></a></p>
<p align="right"><img src="meta/previews/river-light.png?raw=true "river light""/></a></p>

## Shell

Prompt\_ [Starship](https://github.com/starship/starship)

### File structure

#### Global

**$HOME/.config/shell/** - Common config for `bash` and `zsh`

**environment/** - Environment variables
- `00_login` - Environment for login shell
- `10_interactive` - Environment for interactive shell

**functions/**
- `cl` - Cd to a dir and list files with _exa_ or _ls_
- `fapp` - Open apps - `fzf`
- `fcd` - Interactive cd - `fzf`
- `fcdb` - Interactive cd to parent directory - `fzf`
- `fe` - Open file in default editor - `fzf`
- `fimg` - Open images in _sxiv_ or _imv_ - `fzf`
- `fin` - Install pkg with _paru_ - `fzf`
- `fkill` - Kill processes - `fzf`
- `fman` - Search man pages - `fzf`
- `fpkg` - Search installed packages - `fzf`
- `fre` - Remove pkg with _paru_ - `fzf`
- `frg` - Fuzzy grep with _ripgrep_ and open in default editor - `fzf`
- `ft` - Search _ctags_ - `fzf`
- `ftag` - Search _ctags_ generated with `--excmd=number` - `fzf`
- `fvid` - Open videos in _mpv_ - `fzf`
- `hglob` - Help for _zsh_ glob
- `mcd` - mkdir and cd to new dir
- `n` - cd on quit - `nnn`
- `nl` - Open file at given line in _nvim_
- `rgv` - Search with _ripgrep_ and open in _nvim_ quicklist
- `up` - Go up N dir `(e.g. up 2)`
- `zn` - Jump to a directory with _zoxide_ and open it in _neovim_

**plugins/** - Personnal colors, aliases, dircolors, osc7 and starship config

#### Bash

**$HOME/**
- _.bash_logout_
- _.bash_profile_ - Login shell
- _.bashrc_ - Everything

#### Zsh

**$HOME/**
- _.zshenv_ - Login shell

**$HOME/.config/zsh/**
- _.zlogin_ - Post .zshrc
- _.zprofile_ - Login pre .zshrc
- _.zshrc_ - Everything

**$HOME/.local/share/zsh/site-functions/** - User auto completions for some cli tools

**plugins/** - Submodules
- [fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-completions](https://github.com/zsh-users/zsh-completions)

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
- [zoxide](https://github.com/ajeetdsouza/zoxide) - A faster way to navigate your filesystem

