# [ BASHRC ]

[[ $- != *i* ]] && return # If not running interactively, don't do anything

# [ Bash options ]
shopt -s autocd 2>/dev/null   # Prepend cd to directory names automatically
shopt -s dirspell 2>/dev/null # Correct spelling errors during tab-completion
shopt -s cdspell 2>/dev/null  # Correct spelling errors in arguments supplied to cd
shopt -s globstar 2>/dev/null # Turn on recursive globbing (enables ** to recurse all directories)
shopt -s nocaseglob           # Case-insensitive globbing (used in pathname expansion)
shopt -s histappend           # Append to the history file, don't overwrite it
shopt -s cmdhist              # Save multi-line commands as one command
shopt -s checkwinsize         # Check the window size after each command

# [ Bash history ]
HISTCONTROL="erasedups:ignoreboth:ignorespace" # Avoid duplicate entries
export HISTFILE="$HOME"/.cache/bash/bash_history
