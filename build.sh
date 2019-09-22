#!/bin/bash

MAKEOPTS=$*
MAKEOPTS=${MAKEOPTS:-"-j7"}

# clone openwrt and packages
git clone --depth=1 https://github.com/openwrt/openwrt

# copy some configs
cp conf/config.iptime_a604m openwrt/.config
cp conf/feeds.conf openwrt/

pushd openwrt

# prepare package
scripts/feeds update -a
cp -Rfv feeds/stangri/luci-app-vpn-policy-routing feeds/luci/applications/
scripts/feeds update luci
scripts/feeds install -a

# build
make oldconfig
make $MAKEOPTS
popd
