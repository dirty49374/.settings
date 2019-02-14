#!/bin/sh

min=${1:-60}

find .git/objects -type f -cmin -$min | awk -F "/" '{ "git cat-file -t " $3$4 | getline type; if (type == "blob") { print "======= " $3$4; system("git cat-file -p " $3$4)} }'

