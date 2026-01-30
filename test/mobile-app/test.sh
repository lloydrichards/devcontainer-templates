#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

if [ ! -f "test-utils.sh" ]; then
  echo "Missing test-utils.sh" 1>&2
  exit 1
fi

. ./test-utils.sh

if ! command -v check >/dev/null 2>&1; then
  echo "check helper not loaded" 1>&2
  exit 1
fi

check "flutter" /bin/sh -c "command -v flutter >/dev/null 2>&1"
check "dart" /bin/sh -c "command -v dart >/dev/null 2>&1"

reportResults
