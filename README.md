# openwrt-builder

## added package

- vpn-policy-routing
- luci-ssl
- luci-theme-material
- luci-app-vpn-policy-routing
- luci-app-shadowsocks-libev
- openvpn-mbedtls
- shadowsocks-libev-config
- shadowsocks-libev-ss-redir
- shadowsocks-libev-ss-rules
- shadowsocks-libev-ss-tunnel

## removed package

- luci-theme-bootstrap

## applied tweaks

- CONFIG_IPV6 is not set

## docker build

```
# build image
./docker-build-image.sh

# build A604M image
./docker-build.A604M.sh

## build W2914NSv2 image
./docker-build.W2914NSv2.sh
```