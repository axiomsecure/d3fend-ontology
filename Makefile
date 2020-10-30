SHELL ?= /usr/local/bin/bash

build: ## npm run build and move to public folder
	pipenv run python process.py
	pipenv run python makecsv.py

all: build ## the whole thing

help: ##print out this message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: help

.DEFAULT_GOAL := help