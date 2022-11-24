#!/usr/bin/env bash

git stash

echo "$@" | xargs -n1 go generate

# Assert no changes
git diff-index --quiet HEAD || git stash pop && exit 1

git stash pop
