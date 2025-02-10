#!/usr/bin/env bash

node build.js &>/dev/null && \
node build.js -p &>/dev/null && \
node build.js -n &>/dev/null && \
node build.js -a &>/dev/null && \
echo "good"
