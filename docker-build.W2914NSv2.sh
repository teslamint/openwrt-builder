#!/bin/bash

docker run --rm -it -v $PWD/bin:/home/build/openwrt/bin \
    -v $PWD/dl:/home/build/openwrt/dl \
    -v $PWD/conf/config.w2914nsv2:/home/build/openwrt/.config \
    openwrt-builder:latest
