#!/bin/bash

# This script installs all the libraries to be used by Compiler Explorer

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. ${DIR}/common.inc

#########################
# node.js

TARGET_NODE_VERSION=v6.11.3
CURRENT_NODE_VERSION=""
if [[ -d node ]]; then
    CURRENT_NODE_VERSION=$(node/bin/node --version)
fi

if [[ "$TARGET_NODE_VERSION" != "$CURRENT_NODE_VERSION" ]]; then
    echo "Installing node TARGET_NODE_VERSION"
    rm -rf node
    fetch "https://nodejs.org/dist/${TARGET_NODE_VERSION}/node-${TARGET_NODE_VERSION}-linux-x64.tar.gz" | tar zxf - && mv node-${TARGET_NODE_VERSION}-linux-x64 node
fi

#########################
# yarn

TARGET_YARN_VERSION=v1.3.2
CURRENT_YARN_VERSION=""
if [[ -d yarn ]]; then
    CURRENT_YARN_VERSION="v$(yarn/bin/yarn --version)"
fi

if [[ "$TARGET_YARN_VERSION" != "$CURRENT_YARN_VERSION" ]]; then
    echo "Installing yarn TARGET_YARN_VERSION"
    rm -rf yarn
    mkdir yarn
    fetch "https://github.com/yarnpkg/yarn/releases/download/${TARGET_YARN_VERSION}/yarn-${TARGET_YARN_VERSION}.tar.gz" | tar zxf - -C yarn --strip-components=1
fi