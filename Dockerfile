FROM debian:stable-slim
LABEL maintainer="Piotr Findeisen <piotr.findeisen@gmail.com>"

ARG GRAAL_VERSION
ARG JDK_VERSION

RUN set -xeu && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates `# stays, not having this is just not useful` \
        curl \
        && \
    mkdir /graalvm && \
    curl -fsSL "https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${GRAAL_VERSION}/graalvm-ce-${JDK_VERSION}-linux-amd64-${GRAAL_VERSION}.tar.gz" \
        | tar -zxC /graalvm --strip-components 1 && \
    find /graalvm -name "*src.zip"  -printf "Deleting %p\n" -exec rm {} + && \
    { test ! -d /graalvm/legal || tar czf /graalvm/legal.tgz /graalvm/legal/; } && \
    { test ! -d /graalvm/legal || rm -r /graalvm/legal; } && \
    rm -rf /graalvm/man `# does not exist in java11 package` && \
    echo Cleaning up... && \
    apt-get remove -y \
        curl \
        && \
    apt-get autoremove -y && \
    apt-get clean && rm -r "/var/lib/apt/lists"/* && \
    # PATH is set via ENV below. However, `bash -l` will source `/etc/profile` and set $PATH on its own.
    echo 'PATH="/graalvm/bin:$PATH"' | install --mode 0644 /dev/stdin /etc/profile.d/graal-on-path.sh && \
    echo OK

ENV PATH=/graalvm/bin:$PATH JAVA_HOME=/graalvm

# vim:set tw=140:
