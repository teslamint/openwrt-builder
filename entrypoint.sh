#!/bin/sh

cd /home/build/openwrt
make oldconfig
make -j$(nproc)
