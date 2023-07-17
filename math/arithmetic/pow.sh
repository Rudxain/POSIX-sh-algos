#!/bin/sh
set -uf

pow()
{
	base="$1"
	base="$((base))"
	exp="$2"
	exp="$((exp))"
	REPLY=1

	if [ "$exp" -eq 0 ]
	then return 0
	fi

	if [ "$exp" -lt 0 ]
	then
		REPLY="$((1/base))"
		return 0
	fi

	if [ "$base" -eq 0 ]
	then
		REPLY=0
		return 0
	fi

	while [ "$exp" -gt 0 ]
	do
		if [ "$((exp % 2))" -ne 0 ]
		then REPLY="$((REPLY * base))"
		fi
		exp="$((exp >> 1))"
		base="$((base * base))"
	done
	if [ "$base" -eq 0 ]
	then return 1 # overflow
	fi
	return 0
}

pow "$1" "$2"
unset base exp
printf '%s\n' "$REPLY"
