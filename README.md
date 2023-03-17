# Android Phone Test Script

This is a Bash script for testing Android phones using the Android Debug Bridge (ADB) tool. The script performs the following tests:

- Checks for connected devices and reads the phone's IMEI and model.
- Wakes up the device and checks if it is unlocked. If it is locked, it tries to unlock the device using a standard passphrase. (1234)
- Launches the phone app and opens the dialer.
- Launches the hardware test (\*#0#*) and tests the screen's red, green, and blue colors.
- Starts the camera and takes a picture.
- Closes the hardware test and locks the screen.

# Getting Started

To use this script, you need to have ADB installed on your computer and connect an Android device to your computer via USB. (Don't forget to enbale USB debugging and accept the certificate.)

# Usage

- Download the script to your computer.
- Open a terminal window and navigate to the directory where the script is located.
- Run the script by typing ./android_phone_test.sh.

# Notes

- If the device is locked and cannot be unlocked automatically, the script will prompt you to unlock the device manually and restart the script.
- The script assumes that everything is located in the default position on the screen. If it is located elsewhere, you will need to modify the adb shell input tap command accordingly.
- The script may not work on all Android devices. (Developed for Samsung Galaxy S6)

# License

This project is licensed under the MIT License. See the LICENSE file for details.