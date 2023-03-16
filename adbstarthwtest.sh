adb shell input keyevent KEYCODE_WAKEUP #wakeup device
adb shell input keyevent 82 #swipe up
adb shell input text 1234 #enter passcode (1234)
adb shell input keyevent 66 #ok

adb shell input keyevent KEYCODE_HOME
adb shell input tap 156 2310 #launch phone app
adb shell input tap 1185 2391 #launch dialer
adb shell input text "*#0*#"

adb shell input tap 244 180 #launch red
adb shell input keyevent KEYCODE_BACK
adb shell input keyevent KEYCODE_BACK

adb shell input tap 720 180 #launch green
adb shell input keyevent KEYCODE_BACK
adb shell input keyevent KEYCODE_BACK

adb shell input tap 1180 180 #launch blue
adb shell input keyevent KEYCODE_BACK
adb shell input keyevent KEYCODE_BACK

adb shell input tap 291 883 #start mega cam
sleep 1
adb shell input tap 2411 744 # take picture
sleep 2
adb shell input keyevent KEYCODE_BACK
adb shell input keyevent KEYCODE_BACK


#close hwtest
adb shell input keyevent KEYCODE_BACK
adb shell input keyevent KEYCODE_BACK
adb shell input keyevent KEYCODE_BACK
adb shell input keyevent KEYCODE_BACK

adb shell input keyevent KEYCODE_POWER
