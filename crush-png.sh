#!/bin/bash

pngcrush -rem allb -brute -reduce "$1" "$1.new"
mv "$1.new" "$1"
optipng -o7 "$1"
