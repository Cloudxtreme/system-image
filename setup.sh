#!/bin/bash

set -e -u

echo "This script will erase /dev/sda, and setup the build environment... press enter to continue"
read nope

mkfs.ext4 /dev/sda
mount /dev/sda /mnt
pacstrap /mnt base
genfstab -p /mnt >> /mnt/etc/fstab
cp ./setup2.sh /mnt/root/setup.sh
cp -R ./ /mnt/root/system-image
chmod +x /mnt/root/setup.sh
arch-chroot /mnt /bin/bash
poweroff
