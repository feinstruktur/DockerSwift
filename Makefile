.PHONY: build enter

IMG=finestructure/swift

build:
	docker build --rm -t $(IMG) .

enter:
	docker run -it --rm --privileged=true --entrypoint bash $(IMG)

