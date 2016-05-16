FROM ubuntu:15.10

LABEL version="2016-05-16"

RUN apt-get update --fix-missing
RUN apt-get upgrade -y
RUN apt-get install -y clang
RUN apt-get install -y sudo curl python-dev libicu-dev
RUN apt-get install -y libxml2

# install swift
ENV SWIFT_URL https://swift.org/builds/development/ubuntu1510/swift-DEVELOPMENT-SNAPSHOT-2016-05-09-a/swift-DEVELOPMENT-SNAPSHOT-2016-05-09-a-ubuntu15.10.tar.gz
RUN curl ${SWIFT_URL} | tar -xz --strip-components 1
# fix an issue with a modulemap not being world readable
RUN chmod -R o+r /usr/lib/swift

# set up a user
ENV USERNAME swift
RUN adduser --disabled-password ${USERNAME}

# set up a workdir
RUN mkdir /src
RUN chown ${USERNAME} /src
WORKDIR /src
VOLUME /src

USER ${USERNAME}

ENTRYPOINT ["swift"]

CMD ["--version"]

