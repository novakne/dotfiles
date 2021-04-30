# [ ZSHENV ]
#
# ( login & interactive: First )
# zshenv (l/i) -> zprofile (l) -> zshrc (i) -> zlogin (l) -> zlogout


# [ Global env ]
[[ -f "$HOME"/.config/shell/environment/00_global ]] && . "$HOME"/.config/shell/environment/00_global

# [ Zsh configuration path ]
export ZDOTDIR="$DOTFILES_DIR"/config/zsh

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
		source "${ZDOTDIR:-$HOME}/.zprofile"
fi

