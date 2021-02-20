#!/usr/bin/env bash
#
# Display number of packages update available
# by default check every hour
#
# [TAGS]
# {pacman}        pacman packages
# {aur}           manually installed packages (e.g. aur or local repo)
# {pkg}           sum of both
#
# Simple exemple to use in yambar config:
#     - script:
#         path: "/absolute/path/to/pacman.sh"
#         args: [] 
#         content: { string: { text: " {pacman} + {aur} = {pkg}" } }


declare interval pacman_num aur_num pkg_num

while true; do
  # Change interval here
  # NUMBER[SUFFIXE]...
  # Possible suffix:
  #     "s" - seconds "m" - minutes "h" - hours "d" - days 
  interval="1h"
  
  # Change the message you want when there is 0 update
  # Leave empty if you want a 0 instead of a string 
  # (e.g. no_update="")
  no_update=""

  # Get number of packages to update
  pacman_num=$(pacman -Qu | wc -l)
  aur_num=$(pacman -Qmu | wc -l)
  pkg_num=$(( pacman_num + aur_num ))

  # Only display one if there is no update and multiple tags set
  if [[ "${pacman_num}" == 0 && "${aur_num}" == 0 ]]; then
    pacman_num="${no_update:-$pacman_num}"
    aur_num="${no_update:-$aur_num}"
    pkg_num="${no_update:-$pkg_num}"

    printf -- '%s\n' "pacman|string|"
    printf -- '%s\n' "aur|string|"
    printf -- '%s\n' "pkg|string|${pkg_num}"
    printf -- '%s\n' ""
  else 
    printf -- '%s\n' "pacman|string|${pacman_num}"
    printf -- '%s\n' "aur|string|${aur_num}"
    printf -- '%s\n' "pkg|string|${pkg_num}"
    printf -- '%s\n' ""
  fi

  sleep ${interval}

done

unset -v interval pacman_num aur_num pkg_num

