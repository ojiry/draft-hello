.PHONY: all
all: build

.PHONY: build
build:
	GOBIN=$(CURDIR)/bin go install github.com/ojiry/draft-hello/cmd/...
