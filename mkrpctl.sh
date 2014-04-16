#!/bin/sh

cat << EOF
$1.loc
$1.ped
$1.out
all
n
n
F
M
$(grep " .* .*" $1.loc | wc -l)
0.01
1
1000.0
EOF
