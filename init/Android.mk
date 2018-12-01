# Copyright (C) 2018 The Rise OS Project
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

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_INIT_VENDOR_LIB), libinit_suzu)
include $(CLEAR_VARS)
LOCAL_SRC_FILES := init_suzu.cpp
LOCAL_MODULE := libinit_suzu
LOCAL_C_INCLUDES := \
    system/core/base/include \
    system/core/init
include $(BUILD_STATIC_LIBRARY)
endif

ifeq ($(TARGET_INIT_VENDOR_LIB), libinit_discovery)
include $(CLEAR_VARS)
LOCAL_SRC_FILES := init_discovery.cpp
LOCAL_MODULE := libinit_discovery
LOCAL_C_INCLUDES := \
    system/core/base/include \
    system/core/init
include $(BUILD_STATIC_LIBRARY)
endif

ifeq ($(TARGET_INIT_VENDOR_LIB), libinit_pioneer)
include $(CLEAR_VARS)
LOCAL_SRC_FILES := init_pioneer.cpp
LOCAL_MODULE := libinit_pioneer
LOCAL_C_INCLUDES := \
    system/core/base/include \
    system/core/init
include $(BUILD_STATIC_LIBRARY)
endif

ifeq ($(TARGET_INIT_VENDOR_LIB), libinit_voyager)
include $(CLEAR_VARS)
LOCAL_SRC_FILES := init_voyager.cpp
LOCAL_MODULE := libinit_voyager
LOCAL_C_INCLUDES := \
    system/core/base/include \
    system/core/init
include $(BUILD_STATIC_LIBRARY)
endif

ifeq ($(TARGET_INIT_VENDOR_LIB), libinit_maple)
include $(CLEAR_VARS)
LOCAL_SRC_FILES := init_maple.cpp
LOCAL_MODULE := libinit_maple
LOCAL_C_INCLUDES := \
    system/core/base/include \
    system/core/init
include $(BUILD_STATIC_LIBRARY)
endif
