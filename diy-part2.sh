#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.9.1/g' package/base-files/files/bin/config_generate

#Update Argon and modify default theme
rm -rf package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/bootstrap/argon/g' feeds/luci/modules/luci-base/root/etc/config/luci

# add extra package I want to use
git clone https://github.com/xiangfeidexiaohuo/openwrt-packages.git

rm -rf feeds/luci/applications/luci-app-udpxy/luasrc/model/cbi/udpxy.lua
rm -rf feeds/luci/applications/luci-app-mwan3/po/zh-cn/mwan3.po
mv openwrt-packages/files/udpxy.lua feeds/luci/applications/luci-app-udpxy/luasrc/model/cbi/
mv openwrt-packages/files/mwan3.po feeds/luci/applications/luci-app-mwan3/po/zh-cn/

rm -rf package/lean/{k3screenctrl,luci-app-syncdial,luci-app-diskman,luci-app-sfe}

dirs="k3screenctrl,k3screenctrl_build,luci-app-k3screenctrl,luci-app-autotimeset,luci-app-poweroff,luci-app-syncdial,luci-app-smartdns,smartdns,luci-app-adguardhome,luci-app-eqos,luci-app-sfe"                                                                                                
OLD_IFS="$IFS"
IFS=","
array=($dirs)
for i in ${array[@]}
do
    cp -rf openwrt-packages/$i package/lean/
done

rm -rf openwrt-packages
