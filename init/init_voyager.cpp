/*
 * Copyright (C) 2008 The Android Open Source Project
 * Copyright (C) 2014 The CyanogenMod Project
 * Copyright (C) 2018 Pavel Dubrova (Bart. Cubbins) <pashadubrova@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include <android-base/file.h>
#include <android-base/strings.h>

#include "vendor_init.h"
#include "property_service.h"

using android::init::property_set;

void property_override(char const prop[], char const value[])
{
	prop_info *pi;

	pi = (prop_info*) __system_property_find(prop);
	if (pi)
		__system_property_update(pi, value, strlen(value));
	else
		__system_property_add(prop, strlen(prop), value, strlen(value));
}

void import_kernel_cmdline(const std::function<void(const std::string&, const std::string&)>& fn)
{
	std::string cmdline;
	android::base::ReadFileToString("/proc/cmdline", &cmdline);

	for (const auto& entry : android::base::Split(android::base::Trim(cmdline), " ")) {
		std::vector<std::string> pieces = android::base::Split(entry, "=");
		if (pieces.size() == 2) {
			fn(pieces[0], pieces[1]);
		}
	}
}

static void import_kernel_nv(const std::string& key, const std::string& value)
{
	if (key.empty())
		return;

	if (key == "oemandroidboot.phoneid") {
		//Dual Sim variant contains two IMEIs separated by comma.
		if ((count(value.begin(), value.end(),',')) > 0) {
			property_set("persist.multisim.config", "dsds");
			property_set("persist.radio.multisim.config", "dsds");
			property_override("ro.telephony.default_network", "9,0");
			property_override("ro.product.model", "Xperia XA2 Plus Dual");
		} else {
			// This property already set as default in common-prop.mk
			//property_set("ro.telephony.default_network", "9");
			property_override("ro.product.model", "Xperia XA2 Plus");
		}
	}
}

void vendor_load_properties()
{
	import_kernel_cmdline(import_kernel_nv);
}
