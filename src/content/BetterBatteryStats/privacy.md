+++
title = "Privacy Policy"
weight = 6
+++
# Privacy Policy for Better Battery Stats

**Update on 24th of February 2018 for Version 2.3**

The list of permissions required by Better Battery Stats are listed in the Google Play description of the app, with explanations about why the permissions are required and what functions/features are related to these. This privacy policy explains in more details what these permissions are used for.

These permissions are exclusively bound to the features of the app. At no point data is collected, processed or stored for other means than to provide the features of the app. In order to support the development of BetterBatteryStats we use analytics hosted on HockeyApp. Their privacy policy can be found here. This data is solely intended for making the app better and is not published, sold or provided to other external parties than HockeyApp. Of course the analytics feature can be opted-out from, at first run from a pop-up and at any time from the settings in the section "advanced".

This app is open sourced and the source code can be reviewed here.

- android.permission.WRITE_EXTERNAL_STORAGE is used only for writing dumps to the SD card. In case you don't need that feature please feel free to revoke that permission. It won't have any side effect besides disabling that feature
- android.permission.BATTERY_STATS is obviously the permission to access the internal statistics and can not be revoked without making the app unusable (from Kitkat on BBS will have to be installed as a system app to access this permission, or this permission be granted by other means like using the adb development tools)
- android.permission.DUMP from Kitkat on BBS can be installed as a system app to access this permission. It is required to access dumpsys without root for a better performance
android.permission.ACCESS_WIFI_STATE is required since Android Marshmallow in order to access stats. In pre-6.0 version this permission can be revoked
- android.permission.ACCESS_NETWORK_STATE This permission can be revoked
android.permission.RECEIVE_BOOT_COMPLETED is required for cleaning references. Revoking this permission may affect the results of kernel wakelocks and custom reference until new references were saved
android.permission.READ_PHONE_STATE is required to detect when the phone was turned on/off in order to store references for advanced diagnosis
- android.permission.DEVICE_POWER is required to detect when the phone is disconnected from the charger and store the corresponding kernel wakelock reference. Revoking this permission will lead to losing "since unplugged"
- android.permission.BLUETOOTH is required to fix a bug where the communication to the batteryinfo service stops working
android.permission.READ_LOGS is required to allow logcat dumps to be saved. You can revoke this right and will lose only the ability to save logcats
- android.permission.GET_TASKS is required to read the list of running tasks (ps)
- android.permission.WAKE_LOCK is required to hold a wakelock in order to save references when the screen goes off

## Policy up to and including Version 2.2

The list of permissions required by Better Battery Stats are listed in the Google Play description of the app, with explanations about why the permissions are required and what functions/features are related to these. This privacy policy explains in more details what these permissions are used for.

These permissions are exclusively bound to the features of the app. At no point data is collected, processed or stored for other means than to provide the features of the app. No data is ever collected by the app in order to be automatically transmitted, collected, sold or to fulfill other means than fulfilling the features of the app. This app is open sourced and the source code can be reviewed to confirm: https://github.com/asksven/BetterBatteryStats

- android.permission.WRITE_EXTERNAL_STORAGE is used only for writing dumps to the SD card. In case you don't need that feature please feel free to revoke that permission. It won't have any side effect besides disabling that feature
- android.permission.BATTERY_STATS is obviously the permission to access the internal statistics and can not be revoked without making the app unusable (from Kitkat on BBS will have to be installed as a system app to access this permission, or this permission be granted by other means like using the adb development tools)
- android.permission.DUMP from Kitkat on BBS can be installed as a system app to access this permission. It is required to access dumpsys without root for a better performance
- android.permission.ACCESS_WIFI_STATE is required since Android Marshmallow in order to access stats. In pre-6.0 version this permission can be revoked
- android.permission.ACCESS_NETWORK_STATE This permission can be revoked
- android.permission.RECEIVE_BOOT_COMPLETED is required for cleaning references. Revoking this permission may affect the results of kernel wakelocks and custom reference until new references were saved
- android.permission.READ_PHONE_STATE is required to detect when the phone was turned on/off in order to store references for advanced diagnosis
- android.permission.DEVICE_POWER is required to detect when the phone is disconnected from the charger and store the corresponding kernel wakelock reference. Revoking this permission will lead to losing "since unplugged"
- android.permission.BLUETOOTH is required to fix a bug where the communication to the batteryinfo service stops working
- android.permission.READ_LOGS is required to allow logcat dumps to be saved. You can revoke this right and will lose only the ability to save logcats
- android.permission.GET_TASKS is required to read the list of running tasks (ps)
- android.permission.WAKE_LOCK is required to hold a wakelock in order to save references when the screen goes off