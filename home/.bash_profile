# [ BASH_PROFILE ]

[[ -f "$HOME"/.bashrc ]] && . "$HOME"/.bashrc

# [ Global env ]
[[ -f "$HOME"/.config/shell/environment/00_login ]] &&
  . "$HOME"/.config/shell/environment/00_login

# Temporary Files
if [[ ! -d "$TMPDIR" ]]; then
    export TMPDIR="/tmp/$LOGNAME"
    mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/bash"

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "$HOME"/.bash_profile" ]]; then
		source "$HOME"/.bash_profile"
fi

