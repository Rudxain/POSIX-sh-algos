# floor(log_2(n))
ilb() {
	[ "$1" -le 0 ] && return 1
	v="$1"
	# https://graphics.stanford.edu/~seander/bithacks.html#IntegerLog
	REPLY="$(((v>0xFFFF)<<4))";v="$((v>>REPLY))"
	s="$(((v>0xFF)<<3))";v="$((v>>s))";REPLY="$((REPLY|s))"
	s="$(((v>0xF)<<2))";v="$((v>>s))";REPLY="$((REPLY|s))"
	s="$(((v>0x3)<<1))";v="$((v>>s))";REPLY="$((REPLY|s))"
	REPLY="$((REPLY|(v>>1)))"
}
ilog2() { ilb "$1"; }

# as per ISO C23
bit_width() {
	if [ "$1" -eq 0 ]; then
		REPLY=0
		return 0
	fi
	ilb "$1" || return 1
	REPLY="$((REPLY + 1))"
}

ilog10() {
	[ "$1" -le 0 ] && return 1
	REPLY=0
	while [ "$1" -gt 9 ]; do
		set -- "$(($1 / 10))"
		: "$((REPLY++))"
	done
	return 0
}
