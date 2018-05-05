FROM debian:stable-slim
LABEL maintainer="Piotr Findeisen <piotr.findeisen@gmail.com>"

ARG GRAAL_VERSION

RUN set -xeu && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y \
        ca-certificates `# stays, not having this is just not useful` \
        curl \
        gcc `# for graal's native-image` \
        libz-dev `# for graal's native-image` \
        && \
    curl -fsSL "https://github.com/oracle/graal/releases/download/vm-${GRAAL_VERSION}/graalvm-ce-${GRAAL_VERSION}-linux-amd64.tar.gz" \
        -o /tmp/graalvm.tar.gz && \
    mkdir /graalvm && \
    tar -x -f /tmp/graalvm.tar.gz -C /graalvm --strip-components 1 && \
    echo Cleaning up... && \
    apt-get remove -y \
        curl \
        && \
    apt-get autoremove -y && \
    apt-get clean && rm -rf "/var/lib/apt/lists/*" && \
    find /tmp -mindepth 1 -maxdepth 1 -printf "Deleting %p\n" -exec rm -rf {} \; `# this will remove /tmp/.xx too` && \
    echo OK

ENV PATH=/graalvm/bin:$PATH
