.PHONY: build run

IMG=finestructure/swift

build:
	docker build --rm -t $(IMG) .

run:
	docker run -it --rm $(IMG)
