#!/bin/bash

set -e

cp "$1" "$1.backup"

old_size=$(cat "$1" | wc -c)

if [[ "$2" == "pal" ]]; then
  echo "Forcing conversion to paletted image."
  echo ""
  convert "$1" png8:"$1.new"
  mv "$1.new" "$1"
fi

pngcrush -rem allb -brute -reduce "$1" "$1.new"
mv "$1.new" "$1"
optipng -o7 "$1"

new_size=$(cat "$1" | wc -c)

if (( new_size >= old_size )); then
  echo "Could not optimize."
  mv "$1.backup" "$1"
else
  echo "Reduced size by $(( old_size - new_size )) bytes."
  rm "$1.backup"
fi
