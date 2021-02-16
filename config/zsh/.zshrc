# [ ZSHRC ]

# Profiling
# zmodload zsh/zprof

# Wayland
if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    source "$HOME"/.local/bin/wayland-env
fi

# [ Zinit ]
declare -U _zsh_zinit_dir="$ZDOTDIR"/plugins/zinit

if [[ -d "$_zsh_zinit_dir" ]]; then
    declare -A ZINIT
    ZINIT[HOME_DIR]="$_zsh_zinit_dir"
    ZINIT[COMPINIT_OPTS]=-C
    source "$_zsh_zinit_dir"/bin/zinit.zsh

    # Plugins list
    zinit ice wait lucid
    zinit load wfxr/forgit

    zinit ice wait blockf atpull'zinit creinstall -q .' lucid
    zinit light zsh-users/zsh-completions

    zinit ice wait atload"_zsh_autosuggest_start" lucid
    zinit light zsh-users/zsh-autosuggestions
    ZSH_AUTOSUGGEST_USE_ASYNC=true

    zinit ice wait atinit"zpcompinit; zpcdreplay" lucid
    zinit light zdharma/fast-syntax-highlighting
fi

unset _zsh_zinit_dir

# [ Completions ]
[[ -d "$ZDOTDIR"/completions ]] && fpath+=("$ZDOTDIR"/completions)

# [ Lazy load functions ]
declare -U _zsh_fn_dir="$ZDOTDIR"/functions

if [[ -d "$_zsh_fn_dir" ]]; then
    fpath+=("$_zsh_fn_dir")
    for func in "$_zsh_fn_dir"/*; do
        autoload -Uz ${func:t}
    done
fi

unset _zsh_fn_dir

# [ Load zsh options ]
declare -U _zsh_opts_dir="$ZDOTDIR"/config

if [[ -d "$_zsh_opts_dir" ]]; then
    for file in "$_zsh_opts_dir"/*.zsh; do
        source "$file"
    done
fi

unset _zsh_opts_dir

