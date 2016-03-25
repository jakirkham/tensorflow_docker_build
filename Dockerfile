FROM ubuntu:14.04
MAINTAINER Jonathan J. Helmus <jjhelmus@gmail.com>

# Install JDK8
RUN apt-get -y install software-properties-common && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get -y update && \
    apt-get -y install oracle-java8-installer && \
    apt-get -y install pkg-config zip g++ zlib1g-dev unzip

# Install Bazel
RUN wget https://github.com/bazelbuild/bazel/releases/download/0.2.0/bazel-0.2.0-installer-linux-x86_64.sh && \
    chmod +x bazel-0.2.0-installer-linux-x86_64.sh && \
    ./bazel-0.2.0-installer-linux-x86_64.sh && \
    rm bazel-0.2.0-installer-linux-x86_64.sh

# Install tensorflow requirements
RUN apt-get -y install \
    git python-numpy swig python-dev python-setuptools python-wheel
