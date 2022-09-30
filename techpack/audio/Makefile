# auto-detect subdirs
ifneq ($(CONFIG_ARCH_QTI_VM), y)
ifeq ($(CONFIG_QTI_QUIN_GVM), y)
include $(srctree)/techpack/audio/config/gvmauto.conf
endif
ifeq ($(CONFIG_ARCH_SDXPOORWILLS), y)
include $(srctree)/techpack/audio/config/sdxpoorwillsauto.conf
export
endif
ifeq ($(CONFIG_ARCH_SM8150), y)
include $(srctree)/techpack/audio/config/sm8150auto.conf
export
endif
ifeq ($(CONFIG_ARCH_SDMSHRIKE), y)
include $(srctree)/techpack/audio/config/sm8150auto.conf
export
endif
ifeq ($(CONFIG_ARCH_KONA), y)
include $(srctree)/techpack/audio/config/konaauto.conf
endif
ifeq ($(CONFIG_ARCH_LAHAINA), y)
ifneq ($(filter y, $(CONFIG_SEC_O1Q_PROJECT) $(CONFIG_SEC_T2Q_PROJECT) $(CONFIG_SEC_P3Q_PROJECT)),)
include $(srctree)/techpack/audio/config/lahaina_palette.conf

else ifeq ($(CONFIG_SEC_Q2Q_PROJECT), y)
include $(srctree)/techpack/audio/config/lahaina_nexttop.conf

else ifeq ($(CONFIG_SEC_B2Q_PROJECT), y)
include $(srctree)/techpack/audio/config/lahaina_b2.conf

else ifeq ($(CONFIG_SEC_R9Q_PROJECT), y)
include $(srctree)/techpack/audio/config/lahaina_r9.conf

else ifeq ($(CONFIG_SEC_V2Q_PROJECT), y)
include $(srctree)/techpack/audio/config/lahaina_v2.conf

else ifeq ($(CONFIG_SEC_M44X_PROJECT), y)
include $(srctree)/techpack/audio/config/lahaina_m44.conf
else
include $(srctree)/techpack/audio/config/lahainaauto.conf
endif
endif
ifeq ($(CONFIG_ARCH_HOLI), y)
include $(srctree)/techpack/audio/config/holiauto.conf
endif
ifeq ($(CONFIG_ARCH_SA8155), y)
include $(srctree)/techpack/audio/config/sa8155auto.conf
endif
ifeq ($(CONFIG_ARCH_SA6155), y)
include $(srctree)/techpack/audio/config/sa6155auto.conf
endif
ifeq ($(CONFIG_ARCH_SM6150), y)
include $(srctree)/techpack/audio/config/sm6150auto.conf
endif
endif
# Use USERINCLUDE when you must reference the UAPI directories only.
USERINCLUDE     += \
                -I$(srctree)/techpack/audio/include/uapi/audio

# Use LINUXINCLUDE when you must reference the include/ directory.
# Needed to be compatible with the O= option
LINUXINCLUDE    += \
                -I$(srctree)/techpack/audio/include/uapi \
                -I$(srctree)/techpack/audio/include/uapi/audio \
                -I$(srctree)/techpack/audio/include/asoc \
                -I$(srctree)/techpack/audio/include

ifeq ($(CONFIG_QTI_QUIN_GVM), y)
LINUXINCLUDE    += \
                -include $(srctree)/techpack/audio/config/gvmautoconf.h
endif
ifeq ($(CONFIG_ARCH_SDXPOORWILLS), y)
LINUXINCLUDE    += \
                -include $(srctree)/techpack/audio/config/sdxpoorwillsautoconf.h
endif
ifeq ($(CONFIG_ARCH_SM8150), y)
LINUXINCLUDE    += \
                -include $(srctree)/techpack/audio/config/sm8150autoconf.h
endif
ifeq ($(CONFIG_ARCH_SDMSHRIKE), y)
LINUXINCLUDE    += \
                -include $(srctree)/techpack/audio/config/sm8150autoconf.h
endif
ifeq ($(CONFIG_ARCH_KONA), y)
LINUXINCLUDE    += \
                -include $(srctree)/techpack/audio/config/konaautoconf.h
endif
ifeq ($(CONFIG_ARCH_LAHAINA), y)
ifneq ($(filter y, $(CONFIG_SEC_O1Q_PROJECT) $(CONFIG_SEC_T2Q_PROJECT) $(CONFIG_SEC_P3Q_PROJECT)),)
LINUXINCLUDE    += \
                -include $(srctree)/techpack/audio/config/lahaina_palette.h
else ifeq ($(CONFIG_SEC_Q2Q_PROJECT), y)
LINUXINCLUDE    += \
                -include $(srctree)/techpack/audio/config/lahaina_nexttop.h
else ifeq ($(CONFIG_SEC_B2Q_PROJECT), y)
LINUXINCLUDE    += \
                -include $(srctree)/techpack/audio/config/lahaina_b2.h
else ifeq ($(CONFIG_SEC_R9Q_PROJECT), y)
LINUXINCLUDE    += \
                -include $(srctree)/techpack/audio/config/lahaina_r9.h
else ifeq ($(CONFIG_SEC_V2Q_PROJECT), y)
LINUXINCLUDE    += \
                -include $(srctree)/techpack/audio/config/lahaina_v2.h
else ifeq ($(CONFIG_SEC_M44X_PROJECT), y)
LINUXINCLUDE    += \
                -include $(srctree)/techpack/audio/config/lahaina_m44.h
else
LINUXINCLUDE    += \
                -include $(srctree)/techpack/audio/config/lahainaautoconf.h
endif
endif
ifeq ($(CONFIG_ARCH_HOLI), y)
LINUXINCLUDE    += \
                -include $(srctree)/techpack/audio/config/holiautoconf.h
endif
ifeq ($(CONFIG_ARCH_SA8155), y)
LINUXINCLUDE    += \
                -include $(srctree)/techpack/audio/config/sa8155autoconf.h
endif
ifeq ($(CONFIG_ARCH_SA6155), y)
LINUXINCLUDE    += \
                -include $(srctree)/techpack/audio/config/sa6155autoconf.h
endif
ifeq ($(CONFIG_ARCH_SM6150), y)
LINUXINCLUDE    += \
                -include $(srctree)/techpack/audio/config/sm6150autoconf.h
endif
obj-y += soc/
obj-y += dsp/
obj-y += ipc/
obj-y += asoc/
