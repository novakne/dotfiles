# [ ZSHENV ]
#
# ( login & interactive: First )
# zshenv (l/i) -> zprofile (l) -> zshrc (i) -> zlogin (l) -> zlogout


# [ Zsh configuration path ]
export ZDOTDIR=/home/"$USER"/.config/zsh

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
		source "${ZDOTDIR:-$HOME}/.zprofile"
fi

