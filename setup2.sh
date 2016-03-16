#!/bin/bash

set -e -u

# Configuration
echo "BUILD" > /etc/hostname
ln -s /usr/share/zoneinfo/Europe/London /etc/localtime
sed -i 's/#\(en_GB\.UTF-8\)/\1/' /etc/locale.gen
locale-gen
echo root:root | chpasswd

# Build
mkinitcpio -p linux

# Install package
pacman -S grub os-prober make squashfs-tools libisoburn dosfstools dhcp patch lynx devtools git --noconfirm

# Activate Services
systemctl enable dhcpcd
# Install Grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

# Install archiso
git clone git://projects.archlinux.org/archiso.git && cd archiso
make install && cd .. && rm -rf archiso

echo "Finished setting up build environment. Type exit to poweroff"
