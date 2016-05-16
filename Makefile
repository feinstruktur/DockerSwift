.PHONY: build enter

VERSION=2.2.1-1
IMG=finestructure/swift:$(VERSION)

build:
	docker build --rm -t $(IMG) .

enter:
	docker run -it --rm --privileged=true --entrypoint bash $(IMG)

run:
	docker run --rm -it --privileged=true $(IMG)
