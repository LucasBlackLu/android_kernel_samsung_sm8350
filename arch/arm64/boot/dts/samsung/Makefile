# SPDX-License-Identifier: GPL-2.0

ifeq ($(filter y,$(CONFIG_SEC_O1Q_PROJECT)),y)
dts-dirs += o1q
else ifeq ($(filter y,$(CONFIG_SEC_T2Q_PROJECT)),y)
dts-dirs += t2q
else ifeq ($(filter y,$(CONFIG_SEC_P3Q_PROJECT)),y)
dts-dirs += p3q
endif

always          := $(dtb-y)
subdir-y        := $(dts-dirs)

clean-files := *.dtb *.reverse.dts *.dtbo

