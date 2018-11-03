+++
title = "Non-Root Devices"
weight = 5
+++
# TLDR;

This knowledge article describes a method to enable BBS to run on unrooted devices on Android versions starting with Kitkat (on previous versions root is not a must).

As it requires a few tools to be installed on your pc it requires some basic knowledge, understanding, and the readiness to tinker and to learn.
What is describe here is a method to inject according permissions required to access the battery stats using the android debugging bridge to issue commands from the pc. This will allow to grant the needed permissions, that will survive reboots. 


## Credits
All credits for this brilliant approach go to xda developers user @Looki75. My special thanks go to xda-developer user @Perseus as well as to the supportive bbs community in general for their tenacity, feedback and constant support and feedback.


## Details
Congrats, you made it until here, let's get started. 

We will go through all steps of the setup. If you are aware of the tools and techniques please feel free to jump to the appropriate section. 

The initial post on this topic as well as the basic steps (for advanced users) can be found in this [original post](http://forum.xda-developers.com/show...ostcount=30632)
 

1. Install necessary ADB drivers and exe on your PC
This may be the tricky part but we can leverage some experience in that area. A good read:
The 15 second adb installer
 

2. Enable USB debugging on phone's developer options
This is pretty straight forward:
http://www.howtogeek.com/129728/how-...n-android-4.2/

Congratulations, your are now a developer!

3. Connect phone to PC
The easiest part: connect the usb cable on both ends. When you connect the phone to PC on ADB, some models will throw a authorization message on phone Screen asking if you authorize this pc to access the phone. Its a Android M Thing.

4. Run the commands
This requires some explanations and some hints about how to check what may have gone wrong.
Once you have connected your phone via usb start by unlocking your phone and by issuing the command: `adb devices`
If it came back with a Device name instead of waiting for device or `no permissions` (on linux), then you know its safe to go ahead with the real command. Its this adb devices that also triggers the Authorize pc command.

If the `adb devices` command does not return a positive result you may want to look into:
a) on windows the proper installation of the special usb drivers
b) on linux you may need to add some udev rules. This may help: http://stackoverflow.com/questions/3...vice-on-ubuntu

If the `adb devices` returned a positive result is is safe to proceed:

```
adb -d shell pm grant com.asksven.betterbatterystats android.permission.BATTERY_STATS

adb -d shell pm grant com.asksven.betterbatterystats android.permission.DUMP

adb -d shell pm grant com.asksven.betterbatterystats android.permission.PACKAGE_USAGE_STATS <--required only on Lolipop onward and starting with BBS build 2.3-150
```
If you are using the xda-edition the commands needs to be changed to 

```
adb -d shell pm grant com.asksven.betterbatterystats_xdaedition <permissions-goes-here>
```

**Voila...** congrats for your tenacity, you have earned it!