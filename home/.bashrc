# [ BASH ]

[[ $- != *i* ]] && return # If not running interactively, don't do anything


# [ Variables ]
declare _shell_dir _shell_env_dir _shell_fun_dir _shell_plugins_dir _fzf_dir

_shell_dir="$XDG_CONFIG_HOME"/shell
_shell_env_dir="$_shell_dir"/environment
_shell_fun_dir="$_shell_dir"/functions
_shell_plugins_dir="$_shell_dir"/plugins

_fzf_dir="$HOME"/bld/fzf

# [ Helpers ]
_is_command() {
  hash "$1" &> /dev/null
}

_append_path() {
  PATH="${PATH:+${PATH}:}$1"
}

_prepend_path() {
  PATH="$1${PATH:+:${PATH}}"
}


# [ Wayland ]
[[ "$XDG_SESSION_TYPE" == "wayland" ]] && . "$HOME"/.local/bin/wayland-env


# [ Bash options ]
shopt -s autocd 2> /dev/null   # Prepend cd to directory names automatically
shopt -s dirspell 2> /dev/null # Correct spelling errors during tab-completion
shopt -s cdspell 2> /dev/null  # Correct spelling errors in arguments supplied to cd
shopt -s globstar 2> /dev/null # Turn on recursive globbing (enables ** to recurse all directories)
shopt -s nocaseglob            # Case-insensitive globbing (used in pathname expansion)
shopt -s histappend            # Append to the history file, don't overwrite it
shopt -s cmdhist               # Save multi-line commands as one command
shopt -s checkwinsize          # Check the window size after each command

# [ Bash history ]
HISTCONTROL="erasedups:ignoreboth" # Avoid duplicate entries
export HISTFILE="$HOME"/.cache/bash/bash_history

# [ Aliases ]
[[ -r "$_shell_dir"/aliases ]] && . "$_shell_dir"/aliases

# [ Environment variables ]
if [[ -d "$_shell_env_dir" ]]; then
  for var in "$_shell_env_dir"/*; do
    source "${var}"
  done
fi

# [ Functions ]
if [[ -d "$_shell_fun_dir" ]]; then
  for fun in "$_shell_fun_dir"/*; do
    source "${fun}"
  done
fi

# [ Plugins ]
# [ Fzf ]
if [[ -d "$_fzf_dir" ]]; then
    source "$_fzf_dir"/shell/completion.bash 2> /dev/null
    source "$_fzf_dir"/shell/key-bindings.bash
fi

# [ Starship ]
[[ -r "$_shell_plugins_dir"/starship.toml ]] && eval "$(starship init bash)"

# [ Zoxide ]
eval "$(zoxide init bash)"


# [ User plugins ]
# Configure shell to emit the OSC 7 escape sequence
[[ -r "$_shell_plugins_dir"/osc7 ]] && PROMPT_COMMAND+=" osc7_cwd"


unset -v _shell_dir _shell_env_dir _shell_fun_dir _shell_plugins_dir _fzf_dir
unset -f _is_command _append_path _prepend_path
