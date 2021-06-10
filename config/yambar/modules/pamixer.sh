#!/usr/bin/env bash
#
# pamixer.sh - Display volume info
#
# USAGE: pamixer.sh
#
# TAGS:
#  Name      Type  Return
#  -------------------------------------------
#  {volume}  int   volume percentage
#  {mute}    bool  mute state
#
# Exemples configuration:
#    - script:
#         path: /path/to/pamixer.sh
#         args: []
#         content:
#           - map:
#               tag: mute
#               values:
#                 true: {string: {text: , foreground: fc65b0ff}}
#                 false: {string: {text: }}
#           - string: {text: ' {volume}%'}

declare mute volume

# Error message in STDERR
_err()
{
	printf -- '%s\n' "[$(date +'%Y-%m-%d %H:%M:%S')]: $*" >&2
}

while true; do
	# Change interval
	# NUMBER[SUFFIXE]
	# Possible suffix:
	#  "s" seconds / "m" minutes / "h" hours / "d" days
	interval="1s"

	if ! hash pamixer >/dev/null 2>&1; then
		_err "Pamixer not found"
		exit 1
	else
		mute=$(pamixer --get-mute)
		volume=$(pamixer --get-volume)
	fi

	printf -- '%s\n' "volume|int|${volume}"
	printf -- '%s\n' "mute|bool|${mute}"
	printf -- '%s\n' ""

	sleep "${interval}"
done

unset -v mute volume
unset -f _err
