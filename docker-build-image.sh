#!/bin/bash

docker build --rm -f Dockerfile.base -t 'teslamint/openwrt-builder:latest-base' .
docker build --rm -f Dockerfile.a604m -t 'teslamint/openwrt-builder:latest-a604m' .
docker build --rm -f Dockerfile.w2914nsv2 -t 'teslamint/openwrt-builder:latest-w2914nsv2' .
