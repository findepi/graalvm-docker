#!/usr/bin/env bash

set -xeuo pipefail

echo "print(2**42)" > /tmp/test-script.py
docker run -i --rm -v /tmp/test-script.py:/tmp/test-script.py "${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}-polyglot" graalpython /tmp/test-script.py \
    | tee /dev/stderr \
    | grep -xF 4398046511104
