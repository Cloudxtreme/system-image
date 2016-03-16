#!/bin/bash

set -e -u

echo "Enter your desired hostname, followed by [ENTER]:"
read computer_name
echo $computer_name > /etc/hostname
ln -s /usr/share/zoneinfo/Europe/London /etc/localtime
sed -i 's/#\(en_GB\.UTF-8\)/\1/' /etc/locale.gen
locale-gen
echo LANG=en_GB.UTF-8 > /etc/locale.conf
mkinitcpio -p linux
echo root:root | chpasswd
pacman -S make squashfs-tools libisoburn dosfstools patch lynx devtools git
git clone git://projects.archlinux.org/archiso.git && cd archiso
make install && cd .. && rm -rf archiso
