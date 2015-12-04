# DockerSwift

Dockerfile to run Apple’s swift for ubuntu in a docker container

Usage

 - Run `make build` to build the image
 - Run `make enter` to start a bash shell inside the container. From here you can run `swift` to start the REPL.

The Dockerfile sets up a `swift` entrypoint which allows running of local swift files through the linux swift interpreter inside the container. The following two lines should illustrate this:

```
host $ echo 'print("Hello, World")' > foo.swift
host $ docker run --rm -v $(PWD):/src finestructure/swift foo.swift
Hello, World
```

NB: You need to make sure $(PWD) expands to an absolute path. Docker does not allow you to pass in something like `~/mydir` here.
