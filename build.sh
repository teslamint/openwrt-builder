#!/bin/bash

MAKEOPTS=$*
MAKEOPTS=${MAKEOPTS:-"-j7"}

# clone openwrt and packages
git clone --depth=1 https://github.com/openwrt/openwrt
git clone --depth=1 https://github.com/stangri/openwrt_packages stangri_openwrt_packages

# copy some configs
cp conf/config.iptime_a604m openwrt/.config
cp conf/feeds.conf openwrt/

pushd openwrt

# prepare package
scripts/feeds update -a
cp -Rfv ../stangri_openwrt_packages/luci-app-vpn-policy-routing feeds/luci/applications/
scripts/feeds install -a

# build
make oldconfig
make $MAKEOPTS
popd
