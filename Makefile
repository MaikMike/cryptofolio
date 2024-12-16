SHELL=/bin/bash

help: ## Display this help screen.
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install dependencies
	@go mod download
	
start-dev:
	@go run main.go


# go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
# ls $(go env GOPATH)/bin/golangci-lint
# export PATH="$PATH:$(go env GOPATH)/bin"
# source ~/.bashrc  # O ~/.zshrc
lint:
	@go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
	@golangci-lint run ./...