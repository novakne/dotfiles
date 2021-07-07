# ------------------------------------------------
# [ ZPROFILE ]
# ------------------------------------------------
# ( login: pre-zshrc / post-zshenv )

# Only on TTY
[[ "$TTY" == /dev/tty* ]] || return 0

# ------------------------------------------------
# [ HELPERS ]
# ------------------------------------------------
_is_command()
{
	hash "$1" >/dev/null 2>&1
}

_append_path()
{
	PATH="${PATH:+${PATH}:}$1"
}

_prepend_path()
{
	PATH="$1${PATH:+:${PATH}}"
}

# ------------------------------------------------
# [ LOGIN ENV ]
# ------------------------------------------------
[[ -f "$ZDOTDIR"/environment/00_login ]] &&
	. "$ZDOTDIR"/environment/00_login

# ------------------------------------------------
# [ TEMPORARY FILES ]
# ------------------------------------------------
if [[ ! -d "$TMPDIR" ]]
then
	export TMPDIR="/tmp/$LOGNAME"
	mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
