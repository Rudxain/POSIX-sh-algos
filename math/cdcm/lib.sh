#!/bin/sh
set -euf

abs() {
	REPLY="$1"
	REPLY="$((+REPLY))"
	if [ "$REPLY" -lt 0 ]
	then
		REPLY="$((-REPLY))"
	fi
}

# 2-adic
gcd2() {
	a="$1"
	b="$2"
	while [ "$b" -ne 0 ]
	do
		_tmp="$a"
		a="$b"
		b="$((_tmp % b))"
	done
	unset _tmp b
	abs "$a"
	unset a
}

# variadic
gcd_() {
	REPLY=0
	for x in "$@"
	do
		# implicit functional `reduce`
		gcd2 "$REPLY" "$x"
	done
	unset x
}


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