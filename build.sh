#!/bin/bash

MAKEOPTS=$*
MAKEOPTS=${MAKEOPTS:-"-j7"}

# clone openwrt and packages
git clone --depth=1 https://github.com/openwrt/openwrt
git clone --depth=1 -b openwrt-19.07 https://github.com/openwrt/luci
git clone --depth=1 https://github.com/stangri/openwrt_packages stangri_openwrt_packages

# prepare package
cp -Rfv stangri_openwrt_packages/luci-app-vpn-policy-routing luci/applications/

# copy some configs
cp conf/config.iptime_a604m openwrt/.config
cp conf/feeds.conf openwrt/

pushd openwrt
scripts/feeds update -a
scripts/feeds install -a
make oldconfig
make $MAKEOPTS
popd
