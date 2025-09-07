# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Add common definitions for Qualcomm
$(call inherit-product, hardware/qcom-caf/common/common.mk)

# Boot animation
TARGET_SCREEN_WIDTH=1080
TARGET_SCREEN_HEIGHT=2400

# Inherit from our custom product configuration
$(call inherit-product, vendor/aicp/config/common_full_phone.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/asus/zenfone9/device.mk)

# Discard inherited values and use our own instead.
PRODUCT_DEVICE := zenfone9
PRODUCT_NAME := aicp_zenfone9
PRODUCT_BRAND := asus
PRODUCT_MODEL := ASUS_AI2202
PRODUCT_MANUFACTURER := asus

PRODUCT_GMS_CLIENTID_BASE := android-asus

TARGET_BOARD_PLATFORM := taro
TARGET_BOOTLOADER_BOARD_NAME := taro
TARGET_DEVICE := WW_AI2202
PRODUCT_SYSTEM_DEVICE := ASUS_AI2202
PRODUCT_SYSTEM_NAME := WW_AI2202

PRODUCT_BUILD_PROP_OVERRIDES := \
    BuildFingerprint=asus/WW_AI2202/ASUS_AI2202:14/UKQ1.230924.001/34.0304.2004.87:user/release-keys \
    DeviceName=$(PRODUCT_SYSTEM_DEVICE) \
    DeviceProduct=$(PRODUCT_SYSTEM_NAME) \
    SystemDevice=$(PRODUCT_SYSTEM_DEVICE) \
    SystemName=$(PRODUCT_SYSTEM_NAME)

PRODUCT_PRODUCT_PROPERTIES += \
    ro.build.product=AI2202

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="SpiritCroc"
