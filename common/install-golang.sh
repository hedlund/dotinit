#!/bin/bash

if [ -z "$(which go)" ]; then
  echo "Golang not available. Skipping!"
else
  go get -u github.com/kardianos/govendor
#   go get -u github.com/ramya-rao-a/go-outline
#   go get -u github.com/nsf/gocode
#   go get -u github.com/uudashr/gopkgs/cmd/gopkgs
#   go get -u github.com/acroca/go-symbols
#   go get -u golang.org/x/tools/cmd/guru
#   go get -u golang.org/x/tools/cmd/gorename
#   go get -u github.com/rogpeppe/godef
#   go get -u sourcegraph.com/sqs/goreturns
#   go get -u github.com/golang/lint/golint
fi
