#!/bin/sh
set -euf
. ./lib.sh

gcd_tests() {
	_gcd_code=0

	# identities
	gcd_ 0 0
	if [ "$REPLY" -ne 0 ]
	then
		_gcd_code=1
		echo 'gcd 0 0 != 0'
	fi
	gcd_ 1 0
	if [ "$REPLY" -ne 1 ]
	then
		_gcd_code=1
		echo 'gcd 1 0 != 1'
	fi
	gcd_ 0 1
	if [ "$REPLY" -ne 1 ]
	then
		_gcd_code=1
		echo 'gcd 0 1 != 1'
	fi
	gcd_ -1 0
	if [ "$REPLY" -ne 1 ]
	then
		_gcd_code=1
		echo 'gcd -1 0 != 1'
	fi

	# balance
	for _i in $(seq 256)
	do
		gcd_ "$_i" "$_i"
		if [ "$REPLY" -ne "$_i" ]
		then
			_gcd_code=1
			echo "gcd $_i $_i != $_i"
		fi
	done

	# theorem: gcd(n, n +- 1) = 1. for all Reals
	for _i in $(seq 256)
	do
		gcd_ "$_i" "$((_i - 1))"
		if [ "$REPLY" -ne 1 ]
		then
			_gcd_code=1
			echo "gcd $_i $((_i - 1)) != 1"
		fi
	done

	unset _i

	return "$_gcd_code"
}

lcm_tests() {
	_lcm_code=0

	# identities
	lcm_ 0 0
	if [ "$REPLY" -ne 0 ]
	then
		_lcm_code=1
		echo 'lcm 0 0 != 0'
	fi
	lcm_ 1 0
	if [ "$REPLY" -ne 0 ]
	then
		_lcm_code=1
		echo 'lcm 1 0 != 0'
	fi
	lcm_ 0 1
	if [ "$REPLY" -ne 0 ]
	then
		_lcm_code=1
		echo 'lcm 0 1 != 0'
	fi
	lcm_ -1 0
	if [ "$REPLY" -ne 0 ]
	then
		_lcm_code=1
		echo 'lcm -1 0 != 0'
	fi

	# balance
	for _i in $(seq 256)
	do
		lcm_ "$_i" "$_i"
		if [ "$REPLY" -ne "$_i" ]
		then
			_lcm_code=1
			echo "lcm $_i $_i != $_i"
		fi
	done

	# theorem: lcm(n, n +- 1) = n*(n +- 1). for all Reals
	for _i in $(seq 256)
	do
		lcm_ "$_i" "$((_i - 1))"
		if [ "$REPLY" -ne "$((_i*(_i - 1)))" ]
		then
			_lcm_code=1
			echo "lcm $_i $((_i - 1)) != $((_i*(_i - 1)))"
		fi
	done

	unset _i

	return "$_lcm_code"
}

gcd_tests
lcm_tests