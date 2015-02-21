#!/bin/bash
#
#
# EasyKext.sh is a simple script to install kexts to S/L/E
# It also rebuild the kernel cache and there is no need to
# repair permissions after using it.
#
# Works on OS X 10.6 or later, tested on Yosemite. 
#

echo "Welcome"

x=0
while [ $x != 1 ]; do
read -p "Drag the kext in the terminal:" pathkext
case "$pathkext" in

*.kext )
x=1
;;

* )
echo "Try again...";;
esac
done

kext=${pathkext##*/}
kext2=/System/Library/Extensions/$kext

if [ -e $kext2 ]; then
mkdir /Users/$(whoami)/Desktop/backup
sudo cp -R $kext2 /Users/$(whoami)/Desktop/backup
sudo rm -R $kext2
sudo cp -R $pathkext $kext2
sudo chmod -R 755 $kext2
sudo chown -R root:wheel $kext2
sudo touch /System/Library/Extensions

else

sudo cp -R $pathkext /System/Library/Extensions/
sudo chmod -R 755 $kext2
sudo chown -R root:wheel $kext2
sudo touch /System/Library/Extensions
fi

echo "Done!"
exit








