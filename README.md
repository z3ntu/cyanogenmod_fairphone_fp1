# Build instructions

## Note: It doesn't work yet!

Follow http://wiki.cyanogenmod.org/w/Build_for_one to get all prerequisites until: "Initialize the CyanogenMod source repository"

Download Cyanogenmod 11.0 (this will take about an hour with a decent internet connection (75 MBit/s)
- `cd ~/android/system/`
- `. build/envsetup.sh` (note the dot!)
- `repo init -u https://github.com/CyanogenMod/android.git -b cm-11.0`
- `repo sync`

Get Fairphone specific Android Kernel and Android Device:
Copy `local_manifest.xml` from this repo into .repo/local_manifests/ (you may have to create this folder)
- `repo sync`

Now connect your device to your Computer (you need a working ADB connection)
- `cd device/fp/FP1`
- `./extract-files.sh`
- `croot`

You "should" (actually it's not good) get an error, which says that copying `throttle.sh` failed, if not skip the next part.
- `adb shell`
- `cp /system/etc/throttle.sh /sdcard/throttle.sh`
- `chmod 777 /sdcard/throttle.sh`
- `exit`
- `adb pull /sdcard/throttle.sh`
- Copy this file into `~/android/system/vendor/fp/FP1/proprietary/etc/`

You also should get an error that a file with the name `audio` in the filename failed to copy. As long as there are not two of these errors it is fine.

Dirty hacks in another file incoming! (not documented yet!)

Start building (this will take a REALLY long time, probably at least 1.5 hours!)
- `croot`
- `brunch FP1`
