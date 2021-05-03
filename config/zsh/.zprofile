# [ ZPROFILE ]
#
# ( login: pre-zshrc / post-zshenv )


# Only on TTY
[[ "$TTY" == /dev/tty* ]] || return 0

# [ Login env ]
[[ -f "$HOME"/.config/shell/environment/00_login ]] &&
    . "$HOME"/.config/shell/environment/00_login

# Temporary Files
if [[ ! -d "$TMPDIR" ]]; then
    export TMPDIR="/tmp/$LOGNAME"
    mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

