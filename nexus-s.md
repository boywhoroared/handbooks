# Nexus S

My Nexus works best on Android 4.0.4.

- ROM: Google Android 4.0.4 for Nexus S
- Kernel:  Air Kernel; Use smartassv2, deadline


## Fresh Start

1. Flash ClockWorkMod Recovery.
2. Reboot to recovery.
3. Do a Factory Reset (Wipe `/sdcard` and `/data`).

## Install Factory Image

1. Flash Android 4.0.4 for `soju` (`~/Dropbox/Android/nexus-s/stock/`).  Use the
`flash-all.sh` script.

## Kernel

1. Flash TWRP Recovery. 
2. Reboot to recovery.
3. Backup stock boot animation:
  1. Mount `system`. 
  2. Mount `sdcard`.
  3. Copy `/system/media/bootanimation.zip` to `/sdcard`.
  4. Unmount `system`.
  5. Unmount `sdcard`.
4. Mount USB Storage.
5. Copy Air Kernel to USB storage from `~/Dropbox/Android/nexus-s/kernel/ics/`.
6. Wipe Cache/Davlik.
7. Install/Flash Air Kernel from zip.
8. Wipe Cache/Davlik.
9. Restore stock boot animation:
  1. Mount `system`.
  2. Mount `sdcard`.
  3. Copy `/sdcard/bootanimation.zip` to `/system/media/bootanimation.zip`.
  4. Unmount `system`.
  5. Unmount `sdcard`.
10. Optional: Reboot OR Root.

## Root

1. Reboot to recovery.
2. Mount USB Storage.
3. Copy SuperSU APK from `~/Dropbox/Android/nexus-s/` to USB storage.
4. Flash SuperSU APK.
5. Reboot to System.

## Enable ADB
Enable USB Debugging via Settings > Developer Options > USB Debugging.

## Disable OTA Updates
1. Install FOTAKill via ADB:

   ~~~
   adb install ~/Dropbox/Android/nexus-s/FOTAKill.apk

   # fotakill must be installed as system app to function, so we install it via
   # adb.

   # Remember your device must be booted in system for ADB. Does not work in
   # fastboot/bootloader or recovery.
   ~~~
   
2. Install Root Explorer via ADB:

   ~~~
   adb install ~/Dropbox/Android/nexus-s/RootExplorer.apk
   ~~~

3. Open Root Explorer, then mount / as RW.
4. Rename `/system/etc/security/otacerts.zip` to
   `/system/etc/security/otacerts.zip.backup`
5. Reboot to Recovery.
6. Wipe Cache.
7. Reboot to System.

## Configure Tweaks

1. Install SetCPU: `adb install SetCPU.apk`.
2. Install NSTools: `adb install NSTools.apk` or via Google Play. 
3. Use NSTools to enable: 
   - Backlight Dimmer (turns off capacitative LEDs after a timeout period).
   - Backlight Notifications (blink capacitative LEDs to indicate
       notifications).
4. Use SetCPU to enable the `smartassv2` governor and `deadline` schedulers.


## Install Apps

- Dropbox
- Sunrise Calendar
- WhatsApp
- PowerAmp
