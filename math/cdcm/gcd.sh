#!/bin/sh
set -euf
. ./lib.sh

gcd_ "$@"
echo "$REPLY"