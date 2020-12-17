#!/bin/bash -e

if [ -z "$(which go)" ]; then
  echo "Golang not available. Skipping!"
else
  # Set the GOPATH and make sure the folder exists
  export GOPATH="$HOME/Projects/golang"
  [ ! -d "$GOPATH/src" ] && mkdir -p "$GOPATH/src"

  go get -u github.com/cespare/reflex
fi
