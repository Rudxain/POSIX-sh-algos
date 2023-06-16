#!/bin/sh
fib() {
	set -- "$1" 0 1
	while [ "$1" -gt 0 ]; do
		set -- "$(($1 - 1))" "$3" "$(($2 + $3))"
	done
	REPLY="$2"
}
