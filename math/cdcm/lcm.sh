#!/bin/sh
set -euf
. ./lib.sh

lcm_ "$@"
echo "$REPLY"