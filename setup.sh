#!/bin/bash

set -e -u

echo "This script will erase /dev/sda, and setup the build environment... press enter to continue"
read nope

# Partition the disk
parted --script /dev/sda mktable msdos mkpart primary ext2 0% 512MiB set 1 boot on mkpart primary ext4 512MiB 90% mkpart primary linux-swap 90% 100%
mkfs.ext2 /dev/sda1
mkfs.ext4 /dev/sda2
mkswap /dev/sda3
swapon /dev/sda3

# Mount it
mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

# Install
pacstrap /mnt base
genfstab -p /mnt >> /mnt/etc/fstab
cp ./setup2.sh /mnt/setup.sh
cp -R ./ /mnt/root/system-image
chmod +x /mnt/setup.sh

# Change to it
arch-chroot /mnt /bin/bash

# Done

swapoff /dev/sda3
umount /mnt/boot
umount /mnt
poweroff
