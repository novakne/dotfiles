/!\ This repo is archived, I will only update the one on [sourcehut](https://sr.ht/~novakane/dotfiles/) now.

# Dotfiles

<p align="center"><img src="https://git.sr.ht/~novakane/dotfiles/blob/main/meta/previews/river.png"river""/></a></p>

> _Dotfiles managed with [dotbot][]_

[dotbot]: https://github.com/anishathalye/dotbot

## Infos

-   os _[void linux][]_
-   wm _[river][]_

[void linux]: https://voidlinux.org/
[river]: https://github.com/ifreund/river

### Applications

-   browser . firefox
-   editor . [neovim 5.x][]
-   files manager . [nnn][]
-   mail . [aerc][]
-   media:
    -   image . [imv][]
    -   music . spotify
    -   video . [mpv][]
    -   pdf . [zathura][]
-   notification . [fnott][]
-   rss . [newsboat][]
-   screenshot . [grim][] . [slurp][]
-   tags . [river-tag-overlay][]
-   terminal . [foot][]
-   fonts:
    -   system . [Overpass][]
    -   terminal . [JetBrainsMono Nerd Font][]
-   theme:
    -   icons . [Papirus][]
    -   gtk . [Materia][]

[neovim 5.x]: https://github.com/neovim/neovim
[nnn]: https://github.com/jarun/nnn
[fuzzel]: https://codeberg.org/dnkl/fuzzel
[aerc]: https://git.sr.ht/~sircmpwn/aerc
[imv]: https://github.com/eXeC64/imv
[mpv]: https://github.com/mpv-player/mpv
[zathura]: https://pwmt.org/projects/zathura/
[fnott]: https://codeberg.org/dnkl/fnott
[newsboat]: https://newsboat.org/
[grim]: https://github.com/emersion/grim
[slurp]: https://github.com/emersion/slurp
[river-tag-overlay]: https://git.sr.ht/~leon_plickat/river-tag-overlay
[foot]: https://codeberg.org/dnkl/foot
[Overpass]: https://overpassfont.org/
[JetBrainsMono Nerd Font]: https://github.com/ryanoasis/nerd-fonts
[Papirus]: https://github.com/PapirusDevelopmentTeam/papirus-icon-theme
[Materia]: https://github.com/nana-4/materia-theme

## Shell

I use **zsh** as a login/interactive shell and **bash** for scripting.
A [README][] is available on the `$HOME/.local/bin` directory to explain
each script I use. The prompt is [starship][]

[README]: local/bin/README.md
[starship]: https://github.com/starship/starship

Below is the folders structure of my **zsh** setup

_$HOME/_

-   _.zshenv_ - Login shell

_$HOME/.config/zsh/_

-   environment/ - Environment variables
    -   `00_login` - Environment for login shell
    -   `10_interactive` - Environment for interactive shell
-   plugins/
    -   [zsh-autosuggestions][]
    -   [zsh-completions][]
    -   Personal colors, aliases, dircolors, osc7 and starship config
-   _.zlogin_ - Post .zshrc
-   _.zprofile_ - Login pre .zshrc
-   _.zshrc_ - Everything

[zsh-autosuggestions]: https://github.com/zsh-users/zsh-autosuggestions
[zsh-completions]: https://github.com/zsh-users/zsh-completions

_$HOME/.local/share/zsh/_

-   functions/ - User auto completions for some cli tools
    -   `cl` - cd to a dir and list files with _exa_ or _ls_
    -   `fcd` - interactive cd - `fzf`
    -   `ft` - search _ctags_ - `fzf`
    -   `hglob` - help for _zsh_ glob
    -   `mcd` - mkdir and cd to new dir
    -   `n` - cd on quit - `nnn`
    -   `nl` - open file at given line in _nvim_
    -   `rgv` - search with _ripgrep_ and open in _nvim_ quicfix
    -   `up` - go up N dir `(e.g. up 2)`
    -   `zn` - jump to a directory with _zoxide_ and open it in _neovim_
-   site-functions/ - User auto completions for some cli tools

### Cli tools

-   [bat][] - A cat clone with wings
-   [bottom][] - A cross-platform graphical process/system monitor
-   [delta][] - A viewer for git and diff output
-   [dust][] - du + rust = dust. Like du but more intuitive
-   [exa][] - A modern version of ls
-   [fd][] - A simple, fast and user-friendly alternative to 'find'
-   [fzf][] - Cli fuzzy finder
-   [procs][] - procs is a replacement for ps written in Rust
-   [ripgrep][] - Recursively searches directories for a regex pattern
-   [sd][] - sd is an intuitive find & replace CLI
-   [teeldear][] - A very fast implementation of tldr in Rust
-   [zoxide][] - A faster way to navigate your filesystem

[bat]: https://github.com/sharkdp/bat
[bottom]: https://github.com/ClementTsang/bottom
[delta]: https://github.com/dandavison/delta
[dust]: https://github.com/bootandy/dust
[exa]: https://github.com/ogham/exa
[fd]: https://github.com/sharkdp/fd
[fzf]: https://github.com/junegunn/fzf
[procs]: https://github.com/dalance/procs
[ripgrep]: https://github.com/BurntSushi/ripgrep
[sd]: https://github.com/chmln/sd
[teeldear]: https://github.com/dbrgn/tealdeer
[zoxide]: https://github.com/ajeetdsouza/zoxide

## License

[MIT](LICENSE)
