# [ ZSHENV ]


# [ Global env ]
[[ -f "$HOME"/.config/shell/env-global ]] && . "$HOME"/.config/shell/env-global

# [ Zsh configuration path ]
export ZDOTDIR="$DOTFILES_DIR"/config/zsh

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
		source "${ZDOTDIR:-$HOME}/.zprofile"
fi

