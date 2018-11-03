+++
title = "Change Log"
weight = 4
+++
# Changelog
## V2.2.0.0
- Removed the need for the system app (on rooted devices)
- Support for non-rooted devices (permissions need to be assigned by other means)
- Added Sensor Stats - Replaced "Other" stats label by "Summary"
- Added "note" field to share dialog to add notes to dumpfiles
- Update to most current android-compat-lib
- Alarm details are now scrollable
- Usability and style fixed
- Folded both txt and json representation of the dumpfile into one file
- Crashlog and bug fixes
- I18N

## V2.1.0.0
- Android Marshmallow Support
- New Artwork
- New responsive widget
- Optimized legacy widgets
- New version of the system app
- Fixed Widget not always refreshing at screen on
- Fixed various bugs from crash reports
- Fixed graphs being off on 5.1
- Fixed rate dialog
- Fixed totals in process views
- Specific parser for LG G3 kernel wakelocks

## V2.0.0.0
- All new and shiny, with light and dark themes
- Full Lollipop support
- Lots of I18N (see about dialog for credits)
- Added details about API stats to dumpfile
- System app dialog now links to the recovery ZIPs to be used as workaround
- Added import/export of preferences
- Added option to show/hide spinners
- Show SELinux Policy on System App dialog and Dumpfile
- An attempt to work around BATTERY_INFO service not being reachable on some devices
- Surface errors that may occur while processing stats
- Refactored time and timespan calculations: should avoid any rounding error
- Added ability to save dumpfiles in JSON format from tasker plugin
- Removed sorting
- Removed google analytics
- Removed graph zoom

## V1.16.0.0
- Support of the L developer preview
- Fixed issued with google launcher (no stats)
- New circular gauges (bar can still be selected from settings)
- Some minor UI tweaks
- Update to Dashclock 2.0 API
- No need to enable root features in settings anymore
- Various performance and memory optimizations
- Fixes from crash reports
.... and much more

## V1.15.0.0
- Added support of stats for Kitkat (due to major changes by Google - BBS now requires root on Kitkat to be fully featured)
- Added the possibility to install BBS as system app
- Recreated all icons and support for xxxhdpi densities
- Fixed alarms parsing on 4.3+
- Fixed crash from gplay crash report

## V1.14.0.0
- Fixed various crashreports from gplay
- Added proper permissions for accessing su in manifest
- Hold a permanent su shell for batching all su operations
- Fixed double hashing of partial wakelock accounts causing calculations to fail
- Updated to current lib version
 
## V1.13.4.0
- Database access redesign for multi-device support 

## V1.13.2.0
- Hotfix for users having an FC when starting the app after an upgrade from an earlier version

## V1.13.0.0
- Detect and fix spinner refresh problem leading to stats being shown empty for some users
- Fixed battery / voltage level in dumpfile
- A few typos
- Added "share" feature for dumpfiles, logcat and dmesg
- Refactored RAW stats
- Responsive stat row
- Added timestamps to logcat
- Mask any account data (personal info)
- Fixed missing icon for packages in processes
- Fixed KB icon not showing
- Added dashclock widget (Android 4.2.2+ only)Added JSON marshalling of dumpfile info
 
## V1.12.4.0
- Fixed widget defaults on fresh install
- Widget default fallback stat is boot
- Refresh actions flush the cache to guarantee current data
- Fixed Other stats (deep sleep) being larger than "since"
- Fixed small widget reading wgrong default stat from preferences
- Fixed caching issues
- Fixed synchronization issue sometimes leading to empty "to" stat
- Fixed tasker plugin issue
- Fixed "to" battery % and voltage always being the current value
- Fixed possible FC and error conditions from gplay crash reports
- Fixed errors due to updating from 1.11 to 1.12 (inconsistent readings)
