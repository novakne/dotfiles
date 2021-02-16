# [ ZSHENV ]

# [ Language ]
export LANG=fr_FR.UTF-8
export LANGUAGE=fr_FR.UTF-8
export LC_COLLATE=C

# [ Keyboard ]
export XKB_DEFAULT_MODEL=pc105
export XKB_DEFAULT_LAYOUT=fr

# [ Xdg ]
[[ -z "$XDG_CACHE_HOME" ]]  && export XDG_CACHE_HOME="$HOME"/.cache
[[ -z "$XDG_CONFIG_HOME" ]] && export XDG_CONFIG_HOME="$HOME"/.config
[[ -z "$XDG_DATA_HOME" ]]   && export XDG_DATA_HOME="$HOME"/.local/share

# [ Defaults Apps ]
export BROWSER=firefox
export EDITOR=nvim
export VISUAL=nvim
export PAGER=less

# [ Dotfiles ]
export DOTFILES_DIR="$XDG_DATA_HOME"/dotfiles

# [ Zsh configuration path ]
export ZDOTDIR="$DOTFILES_DIR"/config/zsh

# [ Gpg ] 
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
GPG_TTY=$(tty)
export GPG_TTY
[[ -n "$SSH_CONNECTION" ]] && export PINENTRY_USER_DATA="USE_CURSES=1"

# [ System bin ]
path=(/usr/local/{bin,sbin} $path)
systemctl --user import-environment PATH GNUPGHOME

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
		source "${ZDOTDIR:-$HOME}/.zprofile"
fi
