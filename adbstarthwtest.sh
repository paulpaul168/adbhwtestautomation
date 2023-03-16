#!/bin/bash
echo "Checking for connected devices..."
device_count=$(adb devices | grep -w device | wc -l)
if [ $device_count -gt 0 ]
then
	echo -n "Found "
	echo -n $device_count
	echo " devices."

else
	echo "No device found. Pls connect a device and try again."
	exit -1
fi

echo "Reading Phone data..."
echo -n "IMEI: " && adb shell 'service call iphonesubinfo 1 | grep -o "[0-9a-f]\{8\} " | tail -n+3 | while read a; do echo -n "\u${a:4:4}\u${a:0:4}"; done'
echo ""
adb devices -l | awk 'NR==2{print $5}' #print model

echo "Waking device up."
adb shell input keyevent KEYCODE_WAKEUP #wakeup device

output=$(adb shell dumpsys nfc | grep 'mScreenState=')
if [[ $output == *"mScreenState=ON_UNLOCKED"* ]]; then
	echo "Device is unlocked"
else
	echo "Device is locked"
	echo "Trying to unlock the device with standard passphrase..."
	adb shell input keyevent 82 #swipe up
	adb shell input text 1234 #enter passcode (1234)
	adb shell input keyevent 66 #ok
	sleep .2
	output=$(adb shell dumpsys nfc | grep 'mScreenState=')
	if [[ $output == *"mScreenState=ON_UNLOCKED"* ]]; then
		echo "Succesfully unlocked"
	else
		echo "Unlock failed"
		echo "Please unlock device manually and restart script."
		exit -1
	fi

fi

adb shell input keyevent KEYCODE_HOME
echo "Launching phone app."
adb shell input tap 156 2310 #launch phone app
sleep .2
echo "Launching dialer."
adb shell input tap 1185 2391 #launch dialer
sleep .2
echo "Launching hwtest."
adb shell input text "*#0*#"

echo -n "Testing screen "
echo -n "red "
adb shell input tap 244 180 #launch red
adb shell input keyevent KEYCODE_BACK
adb shell input keyevent KEYCODE_BACK

echo -n "green "
adb shell input tap 720 180 #launch green
adb shell input keyevent KEYCODE_BACK
adb shell input keyevent KEYCODE_BACK

echo -n "blue "
adb shell input tap 1180 180 #launch blue
adb shell input keyevent KEYCODE_BACK
adb shell input keyevent KEYCODE_BACK
echo "done."

echo "Starting Cameratest."
adb shell input tap 291 883 #start mega cam
sleep 2
echo "Taking picture."
adb shell input tap 2411 744 # take picture
sleep 3
adb shell input keyevent KEYCODE_BACK
adb shell input keyevent KEYCODE_BACK

echo "Tests done."
echo "Closing hwtest."
#close hwtest
adb shell input keyevent KEYCODE_BACK
adb shell input keyevent KEYCODE_BACK
adb shell input keyevent KEYCODE_BACK
adb shell input keyevent KEYCODE_BACK

echo "Locking screen."
adb shell input keyevent KEYCODE_POWER

exit 0
