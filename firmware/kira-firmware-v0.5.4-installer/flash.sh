#!/bin/sh
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$PWD/lib"
export PATH="$PATH:$PWD/bin"

DEVICE="308f:0012"
FIRMWARE="kira.v0.5.4.dfu.bin"

# Make sure dfu-util works
dfu-util -V &>/dev/null
if [ $? -ne 0 ]; then
	echo "Please install dfu-util"
	exit
fi

echo "Please plug in your keyboard and press the flash button now."
echo

echo -n "Waiting for Kira in flash mode..."
while true; do
	dfu-util -l | grep -q "${DEVICE}"
	if [ $? -eq 0 ]; then
		break
	fi
	echo -n "."
	sleep 1
done

echo
echo "Device Found!"
echo
sudo dfu-util -D "${FIRMWARE}"
