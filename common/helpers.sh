#!/bin/bash -e

# Check if a command exists
function exists() {
    command -v "$1" >/dev/null 2>&1
}

# Ask a yes/no question
function ask() {
    read -r -p "${1:-Are you sure?} [y/N] " response
    if [[ $response =~ ^(yes|y| ) ]]; then
        return 0
    fi
    return 1
}

# Check if script was called with flag
function has_flag() {
    if [[ " ${BASH_ARGV[@]} " =~ " $1 " ]]; then
        return 0
    fi
    return 1
}