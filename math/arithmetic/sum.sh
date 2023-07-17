#!/bin/sh
set -euf

REPLY=0
for n in "$@"
do
	REPLY="$((REPLY + n))"
done

printf '%s\n' "$REPLY"
