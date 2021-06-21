# Dotfiles

<p align="center"><img src="https://git.sr.ht/~novakane/dotfiles/blob/main/meta/previews/river.png"river""/></a></p>

> _Dotfiles managed with [dotbot](https://github.com/anishathalye/dotbot)_

## Infos

-   os _[void linux](https://voidlinux.org/)_
-   wm _[river](https://github.com/ifreund/river)_

### Applications

-   browser . firefox
-   editor . [neovim 5.x](https://github.com/neovim/neovim)
-   files manager . [nnn](https://github.com/jarun/nnn)
-   launcher . [fuzzel](https://codeberg.org/dnkl/fuzzel)
-   mail . [aerc](https://git.sr.ht/~sircmpwn/aerc)
-   media:
    -   image . [imv](https://github.com/eXeC64/imv)
    -   music . spotify
    -   video . [mpv](https://github.com/mpv-player/mpv)
    -   pdf . [zathura](https://pwmt.org/projects/zathura/)
-   notification . [fnott](https://codeberg.org/dnkl/fnott)
-   rss . [newsboat](https://newsboat.org/)
-   screenshot . [grim](https://github.com/emersion/grim) . [slurp](https://github.com/emersion/slurp)
-   terminal . [foot](https://codeberg.org/dnkl/foot)
-   fonts:
    -   system . [Overpass](https://overpassfont.org/)
    -   terminal . [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts)
-   theme:
    -   icons . [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
    -   gtk . [Materia](https://github.com/nana-4/materia-theme)

## Shell

I use **zsh** as a login/interactive shell and **bash** for scripting.
A [README](local/bin/README.md) is available on the `$HOME/.local/bin` directory to explain each
script I use. The prompt is [starship](https://github.com/starship/starship)

Below is the folders structure of my **zsh** setup

_$HOME/_

-   _.zshenv_ - Login shell

_$HOME/.config/zsh/_

-   environment/ - Environment variables
    -   `00_login` - Environment for login shell
    -   `10_interactive` - Environment for interactive shell
-   plugins/
    -   [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    -   [zsh-completions](https://github.com/zsh-users/zsh-completions)
    -   Personal colors, aliases, dircolors, osc7 and starship config
-   _.zlogin_ - Post .zshrc
-   _.zprofile_ - Login pre .zshrc
-   _.zshrc_ - Everything

_$HOME/.local/share/zsh/_

-   functions/ - User auto completions for some cli tools
    -   `cl` - cd to a dir and list files with _exa_ or _ls_
    -   `fcd` - interactive cd - `fzf`
    -   `fe` - open file in default editor - `fzf`
    -   `fer` - open the selected file in running neovim session if exists - `fzf`
    -   `fkill` - kill processes - `fzf`
    -   `frg` - fuzzy grep with _ripgrep_ and open in default editor - `fzf`
    -   `ft` - search _ctags_ - `fzf`
    -   `hglob` - help for _zsh_ glob
    -   `mcd` - mkdir and cd to new dir
    -   `n` - cd on quit - `nnn`
    -   `nl` - open file at given line in _nvim_
    -   `paste` - paste file/STDIN to <https://0x0.st/>
    -   `rgv` - search with _ripgrep_ and open in _nvim_ quicfix
    -   `up` - go up N dir `(e.g. up 2)`
    -   `zn` - jump to a directory with _zoxide_ and open it in _neovim_
-   site-functions/ - User auto completions for some cli tools

### Cli tools

-   [bat](https://github.com/sharkdp/bat) - A cat clone with wings
-   [bottom](https://github.com/ClementTsang/bottom) - A cross-platform graphical process/system monitor
-   [delta](https://github.com/dandavison/delta) - A viewer for git and diff output
-   [dust](https://github.com/bootandy/dust) - du + rust = dust. Like du but more intuitive
-   [exa](https://github.com/ogham/exa) - A modern version of ls
-   [fd](https://github.com/sharkdp/fd) - A simple, fast and user-friendly alternative to 'find'
-   [fzf](https://github.com/junegunn/fzf) - Cli fuzzy finder
-   [procs](https://github.com/dalance/procs) - procs is a replacement for ps written in Rust
-   [ripgrep](https://github.com/BurntSushi/ripgrep) - Recursively searches directories for a regex pattern
-   [sd](https://github.com/chmln/sd) - sd is an intuitive find & replace CLI
-   [teeldear](https://github.com/dbrgn/tealdeer) - A very fast implementation of tldr in Rust
-   [zoxide](https://github.com/ajeetdsouza/zoxide) - A faster way to navigate your filesystem

## License

[MIT](LICENSE)
