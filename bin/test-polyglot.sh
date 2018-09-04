#!/usr/bin/env bash

set -xeuo pipefail

docker run -i --rm "${IMAGE_NAME}:polyglot" bash -xeuo pipefail <<"EOF" |
# graalpython doesn't accept input as a pipe since 1.0-rc6
cat > /tmp/a.py <<<"print(2**42)"
graalpython /tmp/a.py
EOF
    tee /dev/stderr | \
    grep -xF 4398046511104
