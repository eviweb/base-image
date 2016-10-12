VERSION=`cat $(realpath VERSION)`
VENDOR="eviweb"
IMAGE=`basename $(realpath .)`
TAG=$(shell echo $(VENDOR)/$(IMAGE):$(VERSION))

all:
	make clean
	make rootfs
	make build
	make test

rootfs:
	@docker run --rm \
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
	docker images | grep -Poe "$(VENDOR)/$(IMAGE)\s+$(VERSION)" &> /dev/null && docker rmi $(TAG)
	@docker build -t $(TAG) .

clean:
	rm -rf $(CURDIR)/build/*

test:	
	./tests/debug
	./tests/id

.PHONY: build