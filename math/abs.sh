#!/bin/sh

abs() {
	REPLY="$1"
	if [ "$REPLY" -lt 0 ]
	then
		REPLY="$((-REPLY))"
	fi
}
