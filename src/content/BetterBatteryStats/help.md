+++
title = "Help"
weight = 3
+++
Here you will find details about the views and options of BetterBatteryStats. Further information about using BetterBatteryStats is located in the how-tos.

## References
BetterBatteryStats does not collect data in the background but uses references saved at specific times (on specific events):

- **Boot**: is saved when your phone boots, deletes all other refrences
- **Unplugged**: is saved when you unplug your phone from the charger
- **Charged**: is saved when your phone gets charged to 100%
- **Screen Off**: is saved when the screen of your phone goes off (if the watchdog is enabled)
- **Screen On**: is saved when the screen of your phone goes on (if watchdog activated)
- **Custom**: is saved when you select the option to save a custom reference from the menu
- **Current**: is the current data sample (created on refresh)
As long as those events did not occur or after a reboot BBS will notify you about a missing reference. **This is not a bug, it's the way BBS was designed.**

## Views
These are four views / statistics:

1. **Other**: shows sleep, awake and screen on as well as other important times
1. **Kernel Wakelocks**: shows what kernel activities have kept the phone awake
1. **Partial wakelocks**: shows what apps have kept the phone awake
1. **Alarms**: shows wakeups caused by applications or shrvices
1. **Network**: shows the network usage of apps
1. **CPU states**: shows how much time time was spend at different CPU frequencies
1. **Processes**: shows the cpu time (user and system) processes have consumed
1. **Package info**: the package info can be accessed by clicking on any app icon displayed in the stats. The info shows a summary of permssions and services for the selected app

### Other
This is the overview and shows how much time the phone spent in different states.

This statistic should always be checked first as it gives a good idea about the phone's activity.

- Deep Sleep: the total time the phone was sleeping
- Awake when screen off: the total time the phone was awake while you were not using it
- Screen On: the total time the phone was awake and the display was on
- Phone On: the total time the phone was in a call
- Wifi On: the total time Wifi was on
- Wifi running: the total time Wifi was connected to a SSID
- Bluetooth On: the total time bluetooth was on

### Kernel wakelocks
Kernel wakelocks are held by system tasks or processes to prevent the phone from sleeping while something that should not be interrupted is running.  Like for partial wakelocks long running wakelocks are as important as wakelocks with a high count: a large number of short wake periods can have a huge impact on the awake time as the phone takes some time to wake up and some time to go back to sleep. For example let's assume the phone takes 1/2 second to wake up and sleep again. For a wakelock of 10 seconds the resulting awake time would be 11 seconds. For 10 wakelocks of 0,1 seconds the total wakelock time would be as low as 1 second but the awake time would be 11 seconds. 

### Partial wakelocks
Partial wakelocks are the same as kernel wakelocks except those are held by apps or services to prevent the phone from going to sleep.

### Alarms
Alarms are used by apps to schedule triggers to call the app at certain points in time. Some alarms will only get executed when the phone is already awake, other will cause the phone to wake up. An alarm is always linked to an intent (a unique element of an app that will get called when the alarm triggers.

### Network
Shows the network activity per application. As many phones/tablets have different network interfaces this stats distinguished between e.g. 3G and Wifi traffic.

### CPU States
Shows the time spent in each CPU state (frequency) including the time spent in deep sleep.

### Processes
Shows the processes and their CPU consumption. The CPU consumption is expressed in user CPU and system CPU. Those times are shown in the bar graph with different colors.

## The watchdog
The watchdog is a feature that helps you in analysing what happens when the screen is off. When the watchdog is enabled, a reference 'screen off' is created when the screen turns off. You can also configure the watchdog to automatically create a reference 'screen on' when the screen is turned on (or unlocked, depending on the preferences). Opionally the watchdog will notify you when screen is turned on and the awake ratio was bigger that the configured awake threshold. In order to avoid too much overhead in processing a duration threshold can be set to disable the watchdog for short screen off times.

## Active Monitoring
Active Monitoring is an experimental feature to save references at given configurable intervals. Before enabling Active Monitoring please be aware of the fact that this feature will cause a certain amount of wakeups and an overhead. This feature should only be active for a specific requiring time boxed information. If you don't undertand what this means then Active Monitoring is not a feature that you should use. 