#!/usr/bin/env bash

set -eu -o pipefail

go generate ./...

# Assert no changes
git diff-index --quiet HEAD || exit 1
