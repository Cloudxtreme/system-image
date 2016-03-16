# Bournemouth University System Image - Unofficial Prototype

Image creator using [archiso](https://wiki.archlinux.org/index.php/Archiso).

Hopefully this image will be installed on some of the University computers, booting from a pxe server.

It is still a work in progress, contributions are welcome.

This is an unofficial prototype image being made by a computing student.

## Package changes from mainline archiso
- anaconda
- android-studio
- dbeaver
- eclipse-java
- git
- gnome (minimal)
- intellij-idea-community-edition
- jdk8-openjdk
- jre8-openjdk
- libvirt
- networkmanager
- python2
- qemu
- virt-manager
- vlc
- xorg

## Setup
Download and run the arch linux mainline iso.

Install the dependencies for the `archiso` package:
```bash
    (root): pacman -S make squashfs-tools libisoburn dosfstools patch lynx devtools git
```

Install archiso:
```bash
    (user): git clone git://projects.archlinux.org/archiso.git && cd archiso
    (root): make install && cd .. && rm -rf archiso
```

## Usage
You must run the following command to build the system image, on arch linux:
```bash
    (user): git clone https://github.com/BU-Computing/system-image.git && cd system-image
    (root): ./build.sh -N bu-image -v
```

The iso is then placed within the out directory, e.g. bu-image-2016.03.16-x86_64.iso

Default login:
    Username: student
    Password: student

The system is loaded and runs entirely within ram, so it doesn't require any permanent storage mechanism.

## Todo
- [ ] Selecting software needed
- [ ] LDAP Auth
- [ ] NFS Mount Home Folders
- [ ] Change custom repo server away from student server
- [ ] Torrent PXE
- [ ] Branding (Splash Screen/Naming)
