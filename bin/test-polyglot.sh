#!/usr/bin/env bash

set -xeuo pipefail

image="${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}-polyglot"
graalvm_python="python"

# Verify graalvm_python is indeed GraalVM Python
docker run -i --rm  "${image}" "${graalvm_python}" --version | tee /dev/stderr | grep "GraalPy [0-9.]\\+ (GraalVM CE Native ${GRAAL_VERSION})"

echo "print(2**42)" > /tmp/test-script.py
docker run -i --rm -v /tmp/test-script.py:/tmp/test-script.py "${image}" ${graalvm_python} /tmp/test-script.py \
    | tee /dev/stderr \
    | grep -xF 4398046511104
