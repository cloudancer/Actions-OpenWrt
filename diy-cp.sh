#!/bin/bash

# add packages                                                                                                     
rm -rf package/lean/{k3screenctrl,luci-app-syncdial,luci-theme-argon}

git clone https://github.com/kiss2u/luci-app-eqos.git package/lean/luci-app-eqos
git clone https://github.com/lwz322/k3screenctrl.git package/lean/k3screenctrl
git clone https://github.com/lwz322/k3screenctrl_build.git package/lean/k3screenctrl_build
git clone https://github.com/lwz322/luci-app-k3screenctrl.git package/lean/luci-app-k3screenctrl
git clone https://github.com/sirpdboy/luci-app-autotimeset.git package/lean/luci-app-autotimeset
git clone https://github.com/esirplayground/luci-app-poweroff.git package/lean/luci-app-poweroff
git clone https://github.com/rufengsuixing/luci-app-syncdial.git package/lean/luci-app-syncdial
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon

