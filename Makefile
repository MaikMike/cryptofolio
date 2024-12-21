SHELL=/bin/bash

migrations_count = $(shell ls -1q migrations/* | wc -l)

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

install_migrate: ## Install migrate CLI to work with sql migrations
	@go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest

create_migrations: ## Install migrate CLI to work with sql migrations
	@migrate create -ext sql -dir migrations -seq $(name)

migrations_up: ## Apply all or N up migrations
	@migrate -database postgresql://root:root@localhost:5432/db?sslmode=disable \
	-path migrations up $$(( $(migrations_count) / 2 ))

migrations_down: ## Apply all or N down migrations
	@migrate -database postgresql://root:root@localhost:5432/db?sslmode=disable \
	-path migrations down $$(( $(migrations_count) / 2 ))

test_migrations:
	$(MAKE) start_db
	$(MAKE) migrations_up
	$(MAKE) migrations_down
	$(MAKE) migrations_up
	$(MAKE) migrations_down
	$(MAKE) stop_db

start_db: ## Start a postgres container
	@docker compose -f ./docker/db.docker-compose.yml up -d

stop_db: ## Stop a postgres container
	@docker compose -f ./docker/db.docker-compose.yml down