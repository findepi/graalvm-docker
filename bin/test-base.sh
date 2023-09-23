#!/usr/bin/env bash

set -xeuo pipefail

image="${IMAGE_NAME}:${JDK_VERSION}"
docker run --rm "${image}" java -version 2>&1
docker run --rm "${image}" java -version 2>&1 | grep GraalVM
docker run --rm "${image}" java -version 2>&1 | grep "openjdk version \"${JDK_VERSION#java}."
docker run --rm "${image}" bash -c '$JAVA_HOME/bin/java -version' 2>&1 | tee /dev/stderr | grep GraalVM
