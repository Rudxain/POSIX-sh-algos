#!/bin/sh
. ./abs.sh

# 2-adic
gcd2() {
	while [ "$2" -ne 0 ]; do
		set -- "$2" "$(($1 % $2))"
	done
	abs "$1"
}

# variadic
gcd_() {
	REPLY=0
	for x in "$@"; do
		# implicit functional `reduce`
		gcd2 "$REPLY" "$x"
	done
	unset x
}
