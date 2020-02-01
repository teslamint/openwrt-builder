#!/bin/bash

docker build --rm -it -v $PWD/bin:/home/build/openwrt/bin \
    -v $PWD/dl:/home/build/openwrt/dl \
    -v $PWD/conf/config.iptime_a604m:/home/build/openwrt/.config \
    openwrt-builder:latest
