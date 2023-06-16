#!/bin/sh
. ./ilog.sh

isqrt() {
	if [ "$1" -lt 0 ]; then
		REPLY=''
		return 1
	fi
	if [ "$1" -lt 2 ]; then
		REPLY="$1"
		return 0
	fi
	bit_width "$1"
	# init guess: relative upper half of bits (with remainder)
	REPLY=$(($1 >> (REPLY >> 1)))
	# Heron's/Newton's Method
	REPLY=$((($1/REPLY+REPLY)>>1))
	REPLY=$((($1/REPLY+REPLY)>>1))
	REPLY=$((($1/REPLY+REPLY)>>1))
	REPLY=$((($1/REPLY+REPLY)>>1))
	return 0
}

icbrt() {
	set -- "$1" u
	if [ "$1" -lt 0 ]; then
		set -- "$((-$1))" n
	fi
	if [ "$1" -lt 2 ]; then
		REPLY="$1"
		return 0
	fi
	bit_width "$1"
	# init guess: relative upper third of bits (with remainder)
	REPLY=$(($1 >> (REPLY * 2 / 3)))
	REPLY=$((($1/(REPLY*REPLY)+REPLY+REPLY)/3))
	REPLY=$((($1/(REPLY*REPLY)+REPLY+REPLY)/3))
	REPLY=$((($1/(REPLY*REPLY)+REPLY+REPLY)/3))
	REPLY=$((($1/(REPLY*REPLY)+REPLY+REPLY)/3))
	REPLY=$((($1/(REPLY*REPLY)+REPLY+REPLY)/3))
	[ ${2:-} = n ] && REPLY="-$REPLY"
	return 0
}
