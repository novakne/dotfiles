# [ ZPROFILE ]
#
# Executes commands at login pre-zshrc.

# Only on TTY
[[ "$TTY" == /dev/tty* ]] || return 0

# Autostart X at login
# if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
# 	exec startx "$XDG_CONFIG_HOME/X11/xinitrc"
# fi

# Ssh-agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Temporary Files
if [[ ! -d "$TMPDIR" ]]; then
    export TMPDIR="/tmp/$LOGNAME"
    mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
