# ------------------------------------------------
# [ ZSHRC ]
# ------------------------------------------------
# ( interactive: post-zshenv )

# [ Profiling ]
# zmodload zsh/zprof

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

# Ensure path arrays do not contain duplicates.
typeset -gU path PATH cdpath CDPATH fpath FPATH manpath MANPATH mailpath
typeset -U dir_plugins dir_env dir_share_zsh dir_fzf

dir_plugins="$ZDOTDIR"/plugins
dir_env="$ZDOTDIR"/environment
dir_share_zsh="$XDG_DATA_HOME"/zsh

dir_fzf="$XDG_DATA_HOME"/src/fzf

# ------------------------------------------------
# [ ZSH OPTIONS ]
# ------------------------------------------------
# [ Completions ]
setopt ALWAYS_TO_END    # Move cursor to the end of a completed word
setopt AUTO_PARAM_SLASH # If completed parameter is a directory, add a trailing slash
setopt COMPLETE_ALIASES
setopt COMPLETE_IN_WORD # Complete from both ends of a word
setopt EXTENDEDGLOB     # Enable extended globbing

# If there are more than 5 options allow selecting from a menu
# else don't use any menus at all
if [[ "$NOMENU" -eq 0 ]]
then
	zstyle ':completion:*' menu select=5
else
	setopt NO_AUTO_MENU
fi

# Fallback to built in ls colors
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Make the list prompt friendly
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'

# Make the selection prompt friendly when there are a lot of choices
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Formatting and messages
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

# [ History ]
[[ ! -d "$XDG_CACHE_HOME"/zsh ]] && mkdir -p "$XDG_CACHE_HOME"/zsh

export HISTSIZE=10000 SAVEHIST=10000 HISTFILE="$XDG_CACHE_HOME"/zsh/zhistory
export HISTORY_IGNORE="(ls|cd|cd *|pwd|exit|:q|q|c|e|e *|ea|et|z *|fe|clear|n|N|update|up *|xb *|curl *)"
export HISTTIMEFORMAT="%F %T:  "

setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history
setopt HIST_FIND_NO_DUPS      # Do not display a previously found event
setopt HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate
setopt HIST_IGNORE_DUPS       # Do not record an event that was just recorded again
setopt HIST_IGNORE_SPACE      # Do not record an event starting with a space
setopt HIST_SAVE_NO_DUPS      # Do not write a duplicate event to the history file
setopt INC_APPEND_HISTORY     # Add commands to the history immediately
setopt SHARE_HISTORY          # Share history between all sessions

# [ Misc ]
setopt AUTO_CD           # Go to folder path without using cd
setopt AUTO_PUSHD        # Push the current directory visited on the stack
setopt CORRECT           # Enable built-in command auto-correction
setopt PUSHD_IGNORE_DUPS # Do not store duplicates in the stack
setopt PUSHD_SILENT      # Do not print the directory stack after pushd or popd

# No Beep
setopt NO_BEEP
setopt NO_HIST_BEEP
setopt NO_LIST_BEEP

# ------------------------------------------------
# [ USER ]
# ------------------------------------------------
# [ Environment variables ]
[[ -r "${dir_env}"/10_interactive ]] && . "${dir_env}"/10_interactive

# [ Functions ]
if [[ -d "${dir_share_zsh}"/functions ]]
then
	fpath+=("${dir_share_zsh}"/functions)

	for fn in "${dir_share_zsh}"/functions/*
	do
		autoload -Uz ${fn:t}
	done
fi

# [ Completions ]
[[ -d "${dir_share_zsh}"/site-functions ]] &&
	fpath+=("$dir_share_zsh"/site-functions)

# Load and initialize the completion system ignoring insecure directories with a
# cache time of 20 hours, so it should almost always regenerate the first time a
# shell is opened each day.
autoload -Uz compinit

_comp_path="${XDG_CACHE_HOME:-$HOME/.cache}"/zsh/zcompdump

# #q expands globs in conditional expressions
if [[ $_comp_path(#qNmh-20) ]]
then
	# -C (skip function check) implies -i (skip security check).
	compinit -C -d "$_comp_path"
else
	mkdir -p "$_comp_path:h"
	compinit -i -d "$_comp_path"
fi

unset _comp_path

# Change terminal title
autoload -Uz add-zsh-hook

xterm_title_precmd()
{
	print -Pn -- '\e]2;%n@%m %~\a'
	[[ "$TERM" == 'screen'* ]] &&
		print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}

xterm_title_preexec()
{
	print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
	[[ "$TERM" == 'screen'* ]] &&
		{ print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' &&
			print -n -- "${(q)1}\e\\"; }
}

if [[ "$TERM" == (alacritty*|foot*|kitty*|screen*|tmux*|xterm*) ]]
then
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi

# Unset variables
unset -v dir_plugins dir_env dir_share_zsh dir_fzf
unset -v base00 base01 base02 base03 base04 base05 base06 base07
unset -v red pink orange yellow green blue magenta cyan
unset -f _is_command _append_path _prepend_path

