VERSION=`cat $(realpath VERSION)`
VENDOR="eviweb"
IMAGE=`basename $(realpath .)`
TAG=$(shell echo $(VENDOR)/$(IMAGE):$(VERSION))
ALPINE_VERSION=`cat $(realpath alpine-version)`
ALPINE_TAG=$(shell echo $(VENDOR)/$(IMAGE):$(ALPINE_VERSION))
LATEST_TAG=$(shell echo $(VENDOR)/$(IMAGE):latest)

all:
	make clean
	make rootfs
	make build
	make test

rootfs:
	@docker run --rm \
		-v $(CURDIR)/alpine-version:/alpine-version \
		-v $(CURDIR)/resources:/resources \
		-v $(CURDIR)/runner:/runner \
		-v $(CURDIR)/build:/build \
		imega/base-builder \
		--packages=" \
			apk-tools \
			bash \
			curl \
			git \
			musl-utils \
			su-exec \
			"

build:
	@docker build -t $(TAG) .
	@docker tag $(TAG) $(ALPINE_TAG)
	@docker tag $(TAG) $(LATEST_TAG)
	$(CURDIR)/bin/listpkg $(TAG)

clean:
	rm -rf $(CURDIR)/build/*

test:	
	./tests/debug
	./tests/id

.PHONY: build