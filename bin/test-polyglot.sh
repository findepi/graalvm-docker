#!/usr/bin/env bash

set -xeuo pipefail

docker run -i --rm "${IMAGE_NAME}:polyglot" graalpython /dev/stdin <<<"print(2**42)" | grep -xF 4398046511104
