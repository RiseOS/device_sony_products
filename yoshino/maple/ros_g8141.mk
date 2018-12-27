# Copyright 2018 The Rise OS Project
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

# Bootanimation
TARGET_BOOTANIMATION_SIZE := 1080p

TARGET_KERNEL_CONFIG := aosp_yoshino_maple_defconfig

# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/maple/device.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

PRODUCT_NAME := ros_g8141
PRODUCT_DEVICE := maple
PRODUCT_MODEL := Xperia XZ Premium
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := Sony
