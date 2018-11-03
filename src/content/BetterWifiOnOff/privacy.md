+++
title = "Privacy Policy"
weight = 1
+++
# Privacy Policy for Better Wifi on/off

The list of permissions required by Better Wifi on/off are listed in the Google Play description of the app with explanations about why the permissions are required and what functions/features are related to these. This privacy policy explains in more details what these permissions are used for.

These permissions are exclusively bound to the features of the app. At no point data is collected, processed or stored for other means than to provide the features described. No data is ever collected by the app in order to be transmitted, collected, sold or to fulfill other means than fulfilling the features of the app. This app is open sourced and the source code can be reviewed to confirm: https://github.com/asksven/BetterWifiOnOff

- android.permission.ACCESS_WIFI_STATE: the main feature of this app is to control wifi. This permissions is required to read the current wifi state 
- android.permission.CHANGE_WIFI_STATE, CHANGE_NETWORK_STATE and  android.permission.UPDATE_DEVICE_STATS: these permissions are required to change the wifi state, e.g. turining wifi off when the screen goes off 
- android.permission.WAKE_LOCK: hold a wakelock for the time required to change the wifi state
- android.permission.BATTERY_STATS and  android.permission.DEVICE_POWER: detect if the devices is being charged in order to derive rules to leave wifi on in this state 
- android.permission.INTERNET and android.permission.ACCESS_NETWORK_STATE: required for ads
- android.permission.WRITE_EXTERNAL_STORAGE: save logcat
- android.permission.RECEIVE_BOOT_COMPLETED: start service on boot
- android.permission.READ_PHONE_STATE: this permission is required to detect event such as screen on/off/unlock as the app acts on these transitions to turn wifi back on when e.g. the user unlocks the screen 