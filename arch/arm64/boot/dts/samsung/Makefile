# SPDX-License-Identifier: GPL-2.0

ifeq ($(filter y,$(CONFIG_SEC_T2Q_PROJECT)),y)
dts-dirs += palette/t2q
else ifeq ($(filter y,$(CONFIG_SEC_O1Q_PROJECT)),y)
dts-dirs += palette/o1q
endif

always          := $(dtb-y)
subdir-y        := $(dts-dirs)

clean-files := *.dtb *.reverse.dts *.dtbo

