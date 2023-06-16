# POSIX sh algos
Inspiration:
- [Pure sh Bible](https://github.com/dylanaraps/pure-sh-bible)
- [plain bash algorithms](https://github.com/vtrbtf/bash-algorithms)
- [pure Bash algorithms](https://github.com/bash-bastion/bash-algo)
- [All ▲lgorithms in Shell](https://github.com/AllAlgorithms/shell)
- [The Algorithms](https://github.com/TheAlgorithms)
- [POSIX-compliant implementation of arrays](https://github.com/krebs/array)
- [xxHash-in-shell](https://gitlab.com/rindeal/xxHashish)

Assumptions:
- all arguments passed to functions in `./math/` can be parsed as `int32_t`, as per POSIX which mandates `signed long` (minimum 32bit), unless otherwise specified via doc-comments

Calling convention:
- Return value is written to `REPLY`, which is the Bash convention. This is guaranteed to be faster than printing to `stdout`, and much faster than invoking subshells to capture said `stdout`.
- Since `local` is not POSIX yet, it is the caller's responsibility to restore variables clobbered by functions. I might change this policy in the future; I'm considering:
	- Pseudo-namespacing via special prefixes: "good enough"
	- Move the responsibility to all functions: potentially wasteful overhead, requires `set --`
	- Assume all `sh` implementations support `local`
- I haven't decided the value of `REPLY` on failure:
	- Overwrite by ""?
	- Leave untouched?

## LICENSE
The Unlicense doesn't seem suitable for the future of this repo, so I may switch to a different one (soon)
