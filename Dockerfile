FROM openwrtorg/packages-cci:latest

USER build
WORKDIR /home/build

RUN git clone --depth=1 https://github.com/openwrt/openwrt
RUN git clone --depth=1 https://github.com/stangri/openwrt_packages

WORKDIR /home/build/openwrt
RUN cp feeds.conf.default feeds.conf && \
    sed -i 's/luci.git$/luci.git;openwrt-19.07/' feeds.conf && \
    scripts/feeds update -a && \
    cp -Rfv ../openwrt_packages/vpn-policy-routing feeds/packages/net/ && \
    cp -Rfv ../openwrt_packages/luci-app-vpn-policy-routing feeds/luci/applications/ && \
    scripts/feeds update packages && \
    scripts/feeds update luci && \
    scripts/feeds install -a

ADD entrypoint.sh /home/build/

ENTRYPOINT [ "/home/build/entrypoint.sh" ]
