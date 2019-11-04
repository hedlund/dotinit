#!/bin/bash -e

if [ -z "$(which go)" ]; then
  echo "Golang not available. Skipping!"
else
  # Set the GOPATH and make sure the folder exists
  export GOPATH="$HOME/Projects/golang"
  [ ! -d "$GOPATH/src" ] && mkdir -p "$GOPATH/src"

  go get -u github.com/kardianos/govendor
  go get -u github.com/cespare/reflex

  # Go kit
  go get -u google.golang.org/grpc
  go get -u github.com/golang/protobuf/protoc-gen-go
  go get -u github.com/kujtimiihoxha/kit

  # Dependencies used by vscode-go
  #go get -u github.com/mdempsky/gocode
  #go get -u github.com/uudashr/gopkgs/cmd/gopkgs
  #go get -u github.com/ramya-rao-a/go-outline
  #go get -u github.com/acroca/go-symbols
  #go get -u golang.org/x/tools/cmd/guru
  #go get -u golang.org/x/tools/cmd/gorename
  #go get -u github.com/go-delve/delve/cmd/dlv
  #go get -u github.com/stamblerre/gocode
  #go get -u github.com/rogpeppe/godef
  #go get -u github.com/sqs/goreturns
  #go get -u golang.org/x/lint/golint
fi
