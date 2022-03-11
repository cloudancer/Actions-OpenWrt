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

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify default IP
sed -i 's/192.168.1.1/192.168.9.1/g' package/base-files/files/bin/config_generate

# Modify hostname
sed -i "s/hostname='OpenWrt'/hostname='cloudancer'/g" package/base-files/files/bin/config_generate

# Modify default ssid
sed -i 's/OpenWrt/cloudancer/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Modify default wifi encryption
sed -i 's/none/psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Add default wifi password
sed -i '/psk2/a\ \t\t\tset wireless.default_radio${devidx}.key=passw0rD' package/kernel/mac80211/files/lib/wifi/mac80211.sh
