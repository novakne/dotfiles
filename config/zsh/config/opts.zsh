# [ ZSH BUILTIN OPTIONS ]

# [ Completions ]
setopt COMPLETE_ALIASES
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END

# If there are more than 5 options allow selecting from a menu
	# else don't use any menus at all
if [[ "$NOMENU" -eq 0 ]]; then
	zstyle ':completion:*' menu select=5
else
	setopt no_auto_menu
fi

# Fallback to built in ls colors
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Make the list prompt friendly
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'

# Make the selection prompt friendly when there are a lot of choices
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format $'%{\e[0;34m%}>> %B%d%b%{\e[0m%}'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d'
zstyle ':completion:*:corrections' format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
zstyle ':completion:*' group-name ''

# Ignore completion functions for commands you don't have:
zstyle ':completion::(^approximate*):*:functions' ignored-patterns '_*'

# Add simple colors to kill
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

# Some functions, like _apt and _dpkg, are very slow.
# You can use a cache in order to proxy the list of results
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh

# Fuzzy matching of completions for when you mistype them
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric


# [ Colors ]
autoload -U colors
colors


# [ History ]
[[ ! -d "$XDG_CACHE_HOME"/zsh ]] && mkdir -p "$XDG_CACHE_HOME"/zsh

export HISTSIZE=10000 SAVEHIST=10000 HISTFILE="$XDG_CACHE_HOME"/zsh/zhistory
export HISTORY_IGNORE="(ls|cd|pwd|exit|:q|ea|fe|clear|n|update)"
export HISTTIMEFORMAT="%F %T:  "

# setopt INC_APPEND_HISTORY   # Add commands to the history immediately
setopt APPEND_HISTORY
setopt HIST_IGNORE_SPACE    # Do not record an event starting with a space
setopt HIST_IGNORE_DUPS     # Do not record an event that was just recorded again
setopt HIST_IGNORE_ALL_DUPS # Delete an old recorded event if a new event is a duplicate
setopt HIST_FIND_NO_DUPS    # Do not display a previously found event
setopt SHARE_HISTORY        # Share history between all sessions


# [ Misc ]
setopt AUTO_CD           # Go to folder path without using cd
setopt AUTO_PUSHD        # Push the current directory visited on the stack
setopt PUSHD_IGNORE_DUPS # Do not store duplicates in the stack
setopt PUSHD_SILENT      # Do not print the directory stack after pushd or popd
setopt CORRECT           # Enable built-in command auto-correction
setopt EXTENDEDGLOB      # Enable extended globbing

# No Beep
setopt NO_BEEP
setopt NO_LIST_BEEP
setopt NO_HIST_BEEP

