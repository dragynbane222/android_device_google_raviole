#
# SPDX-FileCopyrightText: 2021-2024 The LineageOS Project
# SPDX-FileCopyrightText: 2021-2024 The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common stuff
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
DEVICE_CODENAME := oriole
DEVICE_PATH := device/google/raviole
VENDOR_PATH := vendor/google/oriole
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)
$(call inherit-product, device/google/gs101/lineage_common.mk)
$(call inherit-product, $(DEVICE_PATH)/$(DEVICE_CODENAME)/device-lineage.mk)

# Lunch banner maintainer variable
RISING_MAINTAINER="c_smith"

# Chipset/Maintainer properties (ro.rising.chipset/ro.rising.maintainer) 
# (Optional if builder is setting properties via init_<device>.cpp)
PRODUCT_BUILD_PROP_OVERRIDES += \
    RisingChipset="Google Tensor 1" \
    RisingMaintainer="c_smith"

# chipset flag enclose var with "" if more than one
# this will reflect on build/display version, a firmware package/zip name 
# e.g. risingOS-6.0-COMMUNITY-device-AOSP.zip - AOSP is the default package type, WITH_GMS will override the package type to PIXEL
RISING_PACKAGE_TYPE := "PIXEL"

# disable/enable blur support, default is false
TARGET_ENABLE_BLUR := true

# whether to ship aperture camera, default is false
PRODUCT_NO_CAMERA := false

WITH_GMS := true

TARGET_CORE_GMS := true

TARGET_CORE_GMS_EXTRAS := true

TARGET_DEFAULT_PIXEL_LAUNCHER := false

# Addons
TARGET_HAS_UDFPS := true

# Ship Google Camera
TARGET_PREBUILT_GOOGLE_CAMERA := true

# Ship Matlog
TARGET_SHIPS_MATLOG := true

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 6
PRODUCT_NAME := lineage_$(DEVICE_CODENAME)

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="oriole-user 15 AP3A.241105.007 12470370 release-keys" \
    BuildFingerprint=google/oriole/oriole:15/AP3A.241105.007/12470370:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)
