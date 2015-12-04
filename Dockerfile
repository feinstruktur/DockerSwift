FROM ubuntu:15.10

LABEL version="2015-12-04"

RUN apt-get update --fix-missing
RUN apt-get upgrade -y
RUN apt-get install -y clang
RUN apt-get install -y sudo curl python-dev libicu-dev

ENV SWIFT_URL https://swift.org/builds/ubuntu1510/swift-2.2-SNAPSHOT-2015-12-01-b/swift-2.2-SNAPSHOT-2015-12-01-b-ubuntu15.10.tar.gz
RUN curl ${SWIFT_URL} | tar -xvz --strip-components 1


ENV USERNAME swift
RUN adduser --disabled-password ${USERNAME}
WORKDIR /home/${USERNAME}
USER ${USERNAME}


CMD ["bash"]

