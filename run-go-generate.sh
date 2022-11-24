#!/usr/bin/env bash

pre=$(git diff-index HEAD)

echo "$@" | xargs -n1 go generate

post=$(git diff-index HEAD)

if ! [[ "$pre" == "$post" ]]; then
  echo "You need to run `go generate`"
  exit 1
fi
