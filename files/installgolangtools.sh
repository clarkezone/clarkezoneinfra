#!/bin/bash
set -e

go install "github.com/golangci/golangci-lint/cmd/golangci-lint@latest"
go install "github.com/uw-labs/strongbox@v1.0.0"
go install "sigs.k8s.io/kind@latest"
go install "github.com/homeport/dyff/cmd/dyff@latest"
go install "github.com/spf13/cobra-cli@latest"
go install "github.com/client9/misspell/cmd/misspell@latest"
go install "sigs.k8s.io/kind@v0.14.0"
go install "honnef.co/go/tools/cmd/staticcheck@latest"
go install "github.com/derailed/popeye@latest"
go install "github.com/go-delve/delve/cmd/dlv@latest"
go install "cuelang.org/go/cmd/cue@latest"
go install "github.com/goreleaser/goreleaser@latest"
