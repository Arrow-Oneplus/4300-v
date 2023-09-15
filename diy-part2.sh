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
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
sed -i '/TARGET_LDFLAGS += -lubox -lubus/i\TARGET_CFLAGS += -ffunction-sections -fdata-sections -flto' package/network/services/hostapd/Makefile
sed -i '/TARGET_LDFLAGS += -lubox -lubus/i\TARGET_LDFLAGS += -Wl,--gc-sections -flto=jobserver -fuse-linker-plugin' package/network/services/hostapd/Makefile
sed -i 's/192.168.1.1/192.168.5.31/g' package/base-files/files/bin/config_generate
#svn export --force https://github.com/xiangfeidexiaohuo/openwrt-packages/trunk/op-homebox package/op-homebox
svn export --force https://github.com/kenzok8/small-package/trunk/filebrowser package/filebrowser
svn export --force https://github.com/kenzok8/small-package/trunk/luci-app-filebrowser package/luci-app-filebrowser
svn export --force https://github.com/kenzok8/small-package/trunk/luci-app-tcpdump package/luci-app-tcpdump
svn export --force https://github.com/kenzok8/small-package/trunk/luci-app-packet-capture package/luci-app-packet-capture
svn export --force https://github.com/kenzok8/small-package/trunk/luci-app-poweroffdevice package/luci-app-poweroffdevice
git clone -b main git@github.com:Dr-chen99/luci-app-parentcontrol.git package/luci-app-parentcontrol
git clone -b main git@github.com:Dr-chen99/luci-app-eqosplus.git package/luci-app-eqosplus
