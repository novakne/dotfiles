# [ ZLOGIN ]
#
# Executes commands at login post-zshrc.


# Execute code that does not affect the current session in the background.

declare _zcompdump

{
  # Compile the completion dump to increase startup speed.
  _zcompdump="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"

  if [[ -s "${_zcompdump}" && (! -s "${_zcompdump}.zwc" || "${_zcompdump}" -nt "${_zcompdump}.zwc") ]]; then
    zcompile "${_zcompdump}"
  fi
} &!

unset -v _zcompdump

