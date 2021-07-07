# ------------------------------------------------
# [ BASHRC ]
# ------------------------------------------------

[[ $- != *i* ]] && return # if not running interactively, don't do anything

# ------------------------------------------------
# [ BASH OPTIONS ]
# ------------------------------------------------
# <https://wiki.bash-hackers.org/internals/shell_options>
shopt -s autocd 2>/dev/null   # prepend cd to directory names automatically
shopt -s cdspell 2>/dev/null  # correct spelling errors in arguments supplied to cd
shopt -s checkwinsize         # check the window size after each command
shopt -s cmdhist              # save multi-line commands as one command
shopt -s dirspell 2>/dev/null # correct spelling errors during tab-completion
shopt -s globstar 2>/dev/null # turn on recursive globbing (enables ** to recurse all directories)
shopt -s histappend           # append to the history file, don't overwrite it
shopt -s nocaseglob           # case-insensitive globbing (used in pathname expansion)
bind 'tab:menu-complete'

# ------------------------------------------------
# [ BASH HISTORY ]
# ------------------------------------------------
# use standard iso 8601 timestamp
# %f equivalent to %y-%m-%d
# %t equivalent to %h:%m:%s (24-hours format)
histtimeformat='%f %t '
histsize=10000
histfilesize=10000
histcontrol="erasedups:ignoreboth" # avoid duplicate entries
histignore="ls:cd:cd *:pwd:exit:q:c:e:e *:ea:et:z *:fe:clear:n:N:up *:xb *:curl *"
export histfile="$HOME"/.cache/bash/bash_history
