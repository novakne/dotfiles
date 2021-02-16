# [ ENV ]

# Ensure path arrays do not contain duplicates.
declare -gU path PATH cdpath CDPATH fpath FPATH manpath MANPATH mailpath

# User bin
if [[ -d "$HOME"/.local/bin ]]; then
    path=("$HOME"/.local/{bin,bin{/app,/bat,/colors}} $path)
fi

# User lib
[[ -z "$LIB_HOME" ]] && export LIB_HOME="$HOME"/.local/lib


# [[ PLUGINS ]]
declare -U _zsh_plugins_dir="$ZDOTDIR"/plugins

# [ Dircolors ]
[[ -r "$_zsh_plugins_dir"/dircolors ]] && eval $(dircolors -b "$_zsh_plugins_dir"/dircolors)

# [ Starship ]
if [[ -r "$_zsh_plugins_dir"/starship.toml ]]; then
    export STARSHIP_CONFIG="$_zsh_plugins_dir"/starship.toml
    eval "$(starship init zsh)"
fi

# [ Zoxide ]
if (( $+commands[zoxide] )); then
    export _ZO_ECHO=1
    export _ZO_RESOLVE_SYMLINKS=1
    eval "$(zoxide init zsh)"
fi

# [ Personnal colors ]
[[ -d "$_zsh_plugins_dir"/colors ]] && . "$_zsh_plugins_dir"/colors/kosmikoa

# Configure shell to emit the OSC 7 escape sequence
if [[ -r "$_zsh_plugins_dir"/osc7 ]]; then
    source "$_zsh_plugins_dir"/osc7
    autoload -Uz add-zsh-hook
    add-zsh-hook -Uz chpwd osc7_cwd
fi

unset _zsh_plugins_dir


# [[ CLI PROGRAMS ]]
# [ Fzf ]
declare -U _zsh_fzf_dir="$HOME"/bld/fzf

if [[ -d "$_zsh_fzf_dir" ]]; then
    path+=("$_zsh_fzf_dir"/bin)
    source "$_zsh_fzf_dir"/shell/completion.zsh 2> /dev/null
    source "$_zsh_fzf_dir"/shell/key-bindings.zsh

    export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden -E .git --color=always'
    # Uses tree command to show the entries of the directory
    export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

    _gen_fzf_default_opts() {
        export FZF_DEFAULT_OPTS="
        --color=bg+:$base00,bg:$base00,spinner:$pink,hl:$green
        --color=fg:$base05,header:$pink,info:$pink,pointer:$yellow
        --color=marker:$blue,fg+:$base07,prompt:$pink,hl+:$yellow
        --height 50% --reverse --margin 2% --cycle --multi --ansi
        "
    }

    _gen_fzf_default_opts

    _fzf_compgen_path() {   # Use fd instead of the default find
        fd --hidden --follow --exclude ".git" . "$1"
    }

    _fzf_compgen_dir() {    # Use fd to generate the list for directory completion
        fd --type d --hidden --follow --exclude ".git" . "$1"
    }
fi

unset _zsh_fzf_dir

# [ Less ]
# Set the default Less options.
if (( $+commands[less] )); then
    export LESS='-g -i -M -R -S -w -z-4'
    export LESSHISTFILE=$HOME/.cache/less
    # Colors
    export LESS_TERMCAP_md=$'\e[1;31m'
    export LESS_TERMCAP_me=$'\e[0m'
    export LESS_TERMCAP_se=$'\e[0m'
    export LESS_TERMCAP_so=$'\e[1;40;36m'
    export LESS_TERMCAP_ue=$'\e[0m'
    export LESS_TERMCAP_us=$'\e[1;33m'
fi

# [ Neovim ]
export DIFFPROG="nvim -d" # Use neovim instead of vim for pacdiff
# Give a name to nvim server to start with neovim-remote
(( $+commands[nvr] )) && export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim

# [ Notmuch ]
(( $+commands[notmuch] )) && export NOTMUCH_CONFIG="$XDG_CONFIG_HOME"/notmuch/config

# [ Nnn ]
if (( $+commands[nnn] )); then
    export NNN_OPTS="ceEH"
    export NNN_COLORS='3415'
    export NNN_FCOLORS='070704030f05060808010301'
    export NNN_TRASH=1
    export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)$"
    export NNN_SEL='/tmp/.sel'
    export NNN_FIFO='/tmp/nnn.fifo'
    export NNN_BMS="\
c:~/.config;\
n:~/.config/nvim;\
z:~/.config/zsh;\
a:~/.config/awesome;\
w:~/.config/sway;\
i:~/img;\
s:~/dev;\
b:~/bld;\
e:~/doc;\
l:~/.local;\
d:~/.local/share/dotfiles;"
    export NNN_PLUG="\
f:fuzzy;\
i:imgview;\
o:open;\
c:cmx;\
e:exec;\
n:nvr;\
a:_unar $nnn*"
fi

# [ Pass ]
(( $+commands[pass] )) && export PASSWORD_STORE_DIR="$HOME"/.private/pass

# [ Ripgrep ]
(( $+commands[rg] )) && export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME"/ripgrep/rc


# [[ LANG ]]

# [ C ]
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

#  [ Go ]
if (( $+commands[go] )); then
    export GOPATH="$LIB_HOME"/go
    path+=("$LIB_HOME"/go/bin)
fi

# [ Lua ]
(( $+commands[luarocks] )) && path+=("$LIB_HOME"/luarocks/bin)

# [ Nim ]
(( $+commands[nimble] )) && path+=("$LIB_HOME"/nimble/bin)

# [ Npm ]
if (( $+commands[npm] )); then
    export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
    path+=("$LIB_HOME"/npm/bin)
fi

# [ Ruby ]
if (( $+commands[ruby] )); then
    export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
    path+=("$GEM_HOME"/bin)
fi

# [ Rust ]
if [[ -d "$XDG_DATA_HOME"/rustup && -d "$LIB_HOME"/cargo ]]; then
    export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
    export CARGO_HOME="$LIB_HOME"/cargo
    path+=("$CARGO_HOME"/bin)
fi

# [ Yarn ]
if (( $+commands[yarn] )); then
    path+=("$XDG_CONFIG_HOME"/yarn/global/node_modules/bin)
fi


# [[ MISC ]]
# Cleanup $HOME dir
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export PARALLEL_HOME="$XDG_CACHE_HOME"/parallel
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# [ Bspwm ]
if [[ -d "$XDG_CONFIG_HOME"/bspwm ]]; then
    export PANEL_FIFO='/tmp/panel-fifo'
    path+=("$XDG_CONFIG_HOME"/bspwm/{scripts,panel})
fi

