#!/usr/bin/env bash
#
# Display dwl tags in yambar


fname=/tmp/dwltags-"$WAYLAND_DISPLAY"

while true; do
    
  # Make sure the file exists
  while [ ! -f "${fname}" ]; do
    inotifywait -qqe create "$(dirname "${fname}")"
  done;

  # Wait for dwl to close it after writing
  inotifywait -qqe close_write "${fname}"

  declare titleline tagline title taginfo isactive ctags mtags layout

  titleline="$1"
  tagline=$((titleline+1))
  title=$(sed "${titleline}!d" "${fname}")
  taginfo=$(sed "${tagline}!d" "${fname}")
  isactive=$(printf -- '%s\n' "${taginfo}" | cut -d ' ' -f 1)
  ctags=$(printf -- '%s\n' "${taginfo}" | cut -d ' ' -f 2)
  mtags=$(printf -- '%s\n' "${taginfo}" | cut -d ' ' -f 3)
  layout=$(printf -- '%s\n' "${taginfo}" | cut -d ' ' -f 4-)

  declare -a tag

  for i in {0..8}; do
    mask=$((1<<i))

    if (( "${ctags}" & mask )); then
      n="$((i+1))."
    else
      n="$((i+1))"
    fi

    if (( "${mtags}" & mask )); then
      tag[i]="[ ${n} ]"
    else
      tag[i]=" ${n} "
    fi
  done

  fmt="${tag[*]} ${layout} __${title}"

  printf -- '%s\n' "dwltag|string|${fmt}"
  printf -- '%s\n' ""

done

