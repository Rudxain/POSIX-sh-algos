#!/bin/sh

sum() {
	REPLY=0
	for n in "$@"
	do
		REPLY="$((REPLY + n))"
	done
}
