# Dotfiles

_Dotfiles managed with [dotbot](https://github.com/anishathalye/dotbot)_

# Infos

- os _[void Linux](https://voidlinux.org/)_
- wm _[river](https://github.com/ifreund/river)_

## Applications

- browser . _firefox_
- bar . _[yambar](https://codeberg.org/dnkl/yambar)_
- editor . _[neovim 5.x](https://github.com/neovim/neovim)_
- files manager . _[nnn](https://github.com/jarun/nnn)_
- launcher . _[fuzzel](https://codeberg.org/dnkl/fuzzel)_
- mail . _[aerc](https://git.sr.ht/~sircmpwn/aerc)_
- media:
  * image . _[imv](https://github.com/eXeC64/imv)_
  * music . _spotify_
  * video . _[mpv](https://github.com/mpv-player/mpv)_
  * pdf . _[zathura](https://pwmt.org/projects/zathura/)_
- notification . _[fnott](https://codeberg.org/dnkl/fnott)_
- rss . _[newsboat](https://newsboat.org/)_
- screenshot . _[grim](https://github.com/emersion/grim)_ . _[slurp](https://github.com/emersion/slurp)_
- terminal . _[foot](https://codeberg.org/dnkl/foot)_
- fonts:
  * system . _[Overpass](https://overpassfont.org/)_
  * terminal . _[JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts)_
- theme:
  * icons . _[Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)_
  * gtk . _[Materia](https://github.com/nana-4/materia-theme)_

## Screenshots

<p align="left"><img src="https://git.sr.ht/~novakane/dotfiles/blob/main/meta/previews/river-dark.png"river dark""/></a></p>
<p align="right"><img src="https://git.sr.ht/~novakane/dotfiles/blob/main/meta/previews/river-light.png"river light""/></a></p>

# Shell

- prompt: [Starship](https://github.com/starship/starship)

**$HOME/**
- _.zshenv_ - Login shell

**$HOME/.config/zsh/**
- environment/ - Environment variables
  * `00_login` - Environment for login shell
  * `10_interactive` - Environment for interactive shell
- plugins/
  * [fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting)
  * [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
  * [zsh-completions](https://github.com/zsh-users/zsh-completions)
  * Personal colors, aliases, dircolors, osc7 and starship config
- _.zlogin_ - Post .zshrc
- _.zprofile_ - Login pre .zshrc
- _.zshrc_ - Everything

**$HOME/.local/share/zsh/**
- functions/ - User auto completions for some cli tools
  * `cl` - Cd to a dir and list files with _exa_ or _ls_
  * `fcd` - Interactive cd - `fzf`
  * `fe` - Open file in default editor - `fzf`
  * `fkill` - Kill processes - `fzf`
  * `frg` - Fuzzy grep with _ripgrep_ and open in default editor - `fzf`
  * `ft` - Search _ctags_ - `fzf`
  * `hglob` - Help for _zsh_ glob
  * `mcd` - mkdir and cd to new dir
  * `n` - cd on quit - `nnn`
  * `nl` - Open file at given line in _nvim_
  * `rgv` - Search with _ripgrep_ and open in _nvim_ quicklist
  * `up` - Go up N dir `(e.g. up 2)`
  * `zn` - Jump to a directory with _zoxide_ and open it in _neovim_
- site-functions/ - User auto completions for some cli tools

## Cli tools

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

# License
[MIT](LICENSE)
