#!/bin/bash

FAILED=()
TOTAL=0
PASSED=0

echoStderr()
{
    echo "$@" 1>&2
}

check() {
    LABEL=$1
    shift
    TOTAL=$((TOTAL + 1))
    if "$@"; then
        PASSED=$((PASSED + 1))
        echo "   ${LABEL} --- ✓"
        return 0
    else
        echoStderr "   ${LABEL} --- ✗"
        FAILED+=("$LABEL")
        return 1
    fi
}

reportResults() {
    FAILED_COUNT=${#FAILED[@]}
    PASSED_COUNT=$PASSED
    TOTAL_COUNT=$TOTAL

    echo ""
    if [ ${FAILED_COUNT} -ne 0 ]; then
        echoStderr "Failed tests: ${FAILED[@]}"
    fi

    echo "Tests: ${FAILED_COUNT} failed, ${PASSED_COUNT} passed, ${TOTAL_COUNT} total"

    if [ ${FAILED_COUNT} -ne 0 ]; then
        exit 1
    else
        exit 0
    fi
}
