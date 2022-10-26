#!/usr/bin/env bash

set -xeuo pipefail

image="${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}"
docker run --rm "${image}" java -version 2>&1
docker run --rm "${image}" java -version 2>&1 | grep GraalVM
docker run --rm "${image}" java -version 2>&1 | grep "openjdk version \"${JDK_VERSION#java}."
