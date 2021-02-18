#!/usr/bin/env bash
#
# Display dwl tags in yambar
#     - Requirements: inotifywait ( 'inotify-tools' on arch )

# Use in yambar like this
#     - script:
#         path: "/absolute/path/to/dwl-tags.sh"
#         args: [1]
#         content: {string: {text: "{dwltag}"}}


declare titleline tagline title taginfo isactive ctags mtags layout
declare -a tags name focused
readonly fname=/tmp/dwltags-"$WAYLAND_DISPLAY"


while true; do
    
  # Make sure the file exists
  while [ ! -f "${fname}" ]; do
    inotifywait -qqe create "$(dirname "${fname}")"
  done;

  # Wait for dwl to close it after writing
  inotifywait -qqe close_write "${fname}"

  # Get info from the file
  titleline="$1"
  tagline=$((titleline+1))
  title=$(sed "${titleline}!d" "${fname}")
  taginfo=$(sed "${tagline}!d" "${fname}")
  isactive=$(printf -- '%s\n' "${taginfo}" | cut -d ' ' -f 1)
  ctags=$(printf -- '%s\n' "${taginfo}" | cut -d ' ' -f 2)
  mtags=$(printf -- '%s\n' "${taginfo}" | cut -d ' ' -f 3)
  layout=$(printf -- '%s\n' "${taginfo}" | cut -d ' ' -f 4-)

  tags=( "1" "2" "3" "4" "5" "6" "7" "8" "9" )

  # If you want to add a name to tags
  # if there is no name number are used
  # Comment the next line to just use number
  name=( "" "" "" )

  focused=( false false false false false false false false false )

  for i in {0..8}; do
    mask=$((1<<i))

    # Occupied
    if (( "${ctags}" & mask )); then
      n="$((tags[i]++))."
    else
      n="$((tags[i]++))"
    fi
    
    # Focused
    if (( "${mtags}" & mask )); then
      tags[i]="[ ${name[i]:-${n}} ]"
      # state[i]=true
      # ((focused++))
    else
      tags[i]=" ${name[i]:-${n}} "
      # state[i]=false
      # ((focused++))
    fi

  done

  fmt="${tags[*]} ${layout} [ ${title:-1:50} ]" # Limit title to 50 caracters

  printf -- '%s\n' "dwltag|string|${fmt}"
  # printf -- '%s\n' "focused|bool|${focused}"
  printf -- '%s\n' "" # Need this so tags are updated

done

unset -v titleline tagline title taginfo isactive ctags mtags layout 
unset -v tags name focused
