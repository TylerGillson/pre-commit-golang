#!/usr/bin/env bash

git status >&2

pre=$(git diff-index HEAD)

echo "$@" | xargs -n1 go generate

git status >&2

post=$(git diff-index HEAD)

echo "PRE: $pre" >&2
echo "POST: $post" >&2

if ! [[ "$pre" == "$post" ]]; then
  echo "You need to run `go generate`" >&2
  exit 1
fi
