# ------------------------------------------------
# [ LOGIN ]
# ------------------------------------------------

[[ -f "$HOME"/.bashrc ]] && . "$HOME"/.bashrc

# Temporary Files
if [[ ! -d "$TMPDIR" ]]
then
	export TMPDIR="/tmp/$LOGNAME"
	mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/bash"

# Ensure that a non-login, non-interactive shell has a defined environment.
[[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "$HOME"/.bash_profile ]] &&
	source "$HOME"/.bash_profile
