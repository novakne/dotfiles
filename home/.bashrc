# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ___OPTIONS___
# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null
# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null
# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob
# Append to the history file, don't overwrite it
shopt -s histappend
# Save multi-line commands as one command
shopt -s cmdhist
# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# History
# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"
export HISTFILE="$HOME"/.cache/bash/bash_history

# Prompt
PS1='[\u@\h \W]\$ '

source /home/novakane/.config/broot/launcher/bash/br
