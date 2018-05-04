VERSION = 0.0.1

default: test

HAS_DEP  := $(shell command -v dep;)
HAS_GOXZ := $(shell command -v goxz;)
HAS_GHR  := $(shell command -v ghr;)
HAS_GIT  := $(shell command -v git;)

bootstrap:
ifndef HAS_DEP
	go get -u github.com/golang/dep/cmd/dep
endif
ifndef HAS_GOXZ
	go get -u github.com/Songmu/goxz/cmd/goxz
endif
ifndef HAS_GHR
	go get -u github.com/tcnksm/ghr
endif
ifndef HAS_GIT
	$(error You must install git)
endif
	dep ensure

build:
	GOBIN=$(CURDIR)/bin go install github.com/ojiry/draft-hello/cmd/...

build-cross:
	goxz -pv=v$(VERSION) -arch=386,amd64 -d=dist/v$(VERSION) github.com/ojiry/draft-hello/cmd/hello

clean:
	-rm bin/*
	-rm -rf _dist/

release: build-cross
release:
	ghr -t $(GITHUB_TOKEN) -u ojiry -r draft-hello --replace v$(VERSION) dist/v$(VERSION)

test:
	go test github.com/ojiry/draft-hello/...

.PHONY: bootstrap build build-cross clean release test
