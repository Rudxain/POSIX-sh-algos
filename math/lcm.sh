#!/bin/sh
. ./gcd.sh

# 2-adic
lcm2() {
	a="$1"
	b="$2"
	gcd2 "$a" "$b"
	if [ "$REPLY" -eq 0 ]; then
		REPLY=1
	fi
	REPLY="$((a / REPLY * b))"
}

# variadic
lcm_() {
	REPLY=1
	for x in "$@"
	do
		# implicit functional `reduce`
		lcm2 "$REPLY" "$x"
	done
	unset x
}
