# [ ALIASES ]

# [ Pacman ]
alias upgrade='sudo pacman -Syu'
alias pac='sudo pacman'
alias orph='pacman -Qtdq'
alias spkg='pacman -Q | rg'
alias ipkg='pacman -Qi'

# [ Paru ]
alias pdel='paru -Rsn'
alias delorph='paru -Qtdq | paru -Rns -'

# [ Exa ]
alias exa='exa --group-directories-first --icons'
alias ea='exa -lah --group-directories-first --git --icons'
alias et='exa -lah -TL2 --group-directories-first --git --icons'

# [ Nnn ]
alias N='sudo -E nnn -e'

# [ Trash-cli ]
alias del='trash-put'

# [ Files ]
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=always -d skip'
alias cp='cp -i'
alias df='df -h'
alias free='free -m'
alias cmx='chmod 774'
alias sedit='sudo -E ${EDITOR:-nvim}'

# [ Misc ]
alias :q='exit'
alias sc='systemctl'
alias Xress='xrdb $XDG_CONFIG_HOME/X11/xresources'
alias wname='xprop | grep WM_CLASS'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias awesometest='Xephyr :5 & sleep 1 ; DISPLAY=:5 awesome'
alias mbsync='mbsync -c ~/.config/isync/mbsyncrc'
