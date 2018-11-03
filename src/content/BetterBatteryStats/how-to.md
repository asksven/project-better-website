+++
title = "How-To"
weight = 2
+++
This document provides an insight about how to use BetterBatteryStats to reduce the battery drain in a systematic manner.

First you must select a reference (most of the time "unplugged" to "current" is the best way to start).

## Go to the [Other] view
This document provides an insight about how to use BetterBatteryStats to reduce the battery drain in a systematic manner.

First you must select a reference (most of the time "unplugged" to "current" is the best way to start).

 

### Check the deep sleep, awake and screen on times
The deep sleep and total time tell you how much time your phone has spent in the most power saving mode: ideally the deep sleep time should be near to the total time

The awake when screen off time tells you how much time your phone was awake while you were not using it. Ideally the the awake time should be zero, meaning that the phone was only awake when in use.

**Pro tip**: the responsive widget gives the best overview on how optimal your phones runs

### Check the [Kernel wakelocks]
The list shows you what kernel wakelocks occured: a symbol on the right shows that there is a knowledge-base article on that specific wakelock In the first step we want to check for high times (minutes or more), once there are no hot spots left we want to look at the high counts.

#### The PowerManagerService wakelock
This wakelock shows as a sum of the partial wakelocks on many phones. If this wakelock is #1 go to the Partial Wakelocks to find out more.

#### The multipdp / svnet-dormancy wakelock
This wakelock indicates a high network usage. If this wakelock is #1 go to the Network Stats to find out more.

If the PowerManagerService is not the highest wakelock check the online knowledge-base or use google search to find more information about the wakelock and its potential causes.

Check the [Partial wakelocks]
The list shows you what partial wakelocks occured and for most of them what application caused them. See "What's next" for more details on how to reduce them.

#### The AlarmManager wakelock
High times or count on the AlarmManager wakelock is a sign that either many wakeups were caused by alarms or that apps have added/modified alarms intensively. A detailed overview can be found under [Alarms].

#### The Network Stats
Here you will find what apps / packages are responsible for high data transfers.

#### What's next?
Some but not all wakelocks can be traced back to a specific app. In that case there are following options:

#### Check / change settings
Sometimes we really want the app / functionality causing the wakelocks and the good news is there is still hope. Many apps have settings that condition their behaviour so these should be checked:

frequency: having twitter check for new messages every 2 minutes is not something compatible with a long battery life. Once you know the cost of a functionality it may be easier to decide to use it on demand instead of let it running as a background scheduled task
quantity: check for optional services like e.g. cloud backup, full sync etc. and ask yourself if you really need all that stuff
#### Deinstall or freeze
Once a cause for partial wakelocks has been spotted you have to ask yourself if you even use that app. If not disable/deinstall/freeze it. Go back to the start and take another reading to see the effect of the action.

In some cases it is not possible to attribute a wakelock to an app. In such cases use the knowledge-base and google search to find more information about potential causes.

#### Common tips
 Following tips can help you reducing some causes of awake:

Turn your GPS off when not required to avoid apps using that expensive location source
When you are finished using an app close it with the "back" button. This will terminate it and avoid background management
Don't use any auto killer apps. If there are apps you don't want to be started or cached freeze them or configure their auto-start properly
Don't use and power saving tools like Juice Defender or Green Power: most apps do not behave properly when they can't use the data connection and will generate overhead by trying
If you don't need Wifi turn it off: in some cases Wifi is known to cause wakeups and an overhead in e.g. location services
#### Enjoy your successes
One basic rule in performance optimization is to check the results for each action taken and this applies here too:

- don't make too many changes at once: once a hot spot has been removed you may have a completely different picture. This is why processing two or more findings at once may be a waste of time
- switching kernel, ROM or modem during a round of optimization will probably distort your statistics, avoid running tests during this time as the results may be demotivating
- consider external factors, in case of unexpected stats being reported by BBS, run the tests again to validate readings: our phones are not closed systems and conditions like network coverage may influence readings. In case of doubt, confirm results by repeating the readings under different conditions in order to correctly diagnose a problem
- **don't obsess**: you want to enjoy your phone too, so don't obsess by hunting down the last second of wakelock. Enjoy your results and come back to check the stats from time to time of if you feel your battery life is getting worse
