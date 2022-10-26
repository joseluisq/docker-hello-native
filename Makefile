BUILD_OS ?= $(shell uname -s)
BUILD_ARCH ?= $(shell uname -m)
BUILD_TIME ?= $(shell date -u '+%Y-%m-%d%H:%m:%S%z')
CIRRUS_CHANGE_IN_REPO ?= ""

build:
	@go version
	@go build -v \
		-ldflags "\
			-s -w \
			-X 'main.buildOs=$(BUILD_OS)' \
			-X 'main.buildArch=$(BUILD_ARCH)' \
			-X 'main.buildTime=$(BUILD_TIME)' \
			-X 'main.buildCommit=$(CIRRUS_CHANGE_IN_REPO)' \
		"\
		-a -o hello-native .
	@ls -gh hello-native
.PHONY: build

exec:
	@hello-native
.PHONY: exec


REPOSITORY ?= joseluisq
TAG ?= latest

docker-build:
	@docker build \
		-t $(REPOSITORY)/hello-native:$(TAG) \
		-f Dockerfile .
.PHONY: docker-build
