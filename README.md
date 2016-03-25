## Docker images to build tensorflow in a Docker container

### Instructions

docker build -t test -f Dockerfile .
docker run --net host --privileged -t -i test /bin/bash

```
git clone --recurse-submodules -b v0.7.1 https://github.com/tensorflow/tensorflow
cd tensorflow/
./configure
bazel build -c opt //tensorflow/tools/pip_package:build_pip_package
bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
```
