#!/bin/bash

# Check if a command exists
function exists() {
    command -v "$1" >/dev/null 2>&1
}
