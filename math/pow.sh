#!/bin/sh

pow() {
	base="$1"
	exp="$2"
	REPLY=1

	[ "$exp" -eq 0 ] && return 0

	if [ "$exp" -lt 0 ]; then
		REPLY="$((1/base))"
		return 0
	fi

	if [ "$base" -eq 0 ]; then
		REPLY=0
		return 0
	fi

	while [ "$exp" -gt 0 ]
	do
		[ "$((exp % 2))" -ne 0 ] && REPLY="$((REPLY * base))"
		exp="$((exp >> 1))"
		base="$((base * base))"
	done
	[ "$base" -eq 0 ] && return 1 # overflow
	return 0
}
