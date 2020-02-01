#!/bin/bash

docker run --rm -it -v $PWD/bin:/home/build/openwrt/bin \
    -v $PWD/dl:/home/build/openwrt/dl \
    openwrt-builder:latest-a604m
