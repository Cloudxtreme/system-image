# Bournemouth University System Image - Unofficial Prototype

Image creator using [archiso](https://wiki.archlinux.org/index.php/Archiso).

Hopefully this image will be installed on some of the University computers, booting from a pxe server.

It is still a work in progress, contributions are welcome.

This is an unofficial prototype image being made by a computing student.

## Package changes from mainline archiso
- base-devel
- git
- xorg
- gnome
- networkmanager
- jdk8-openjdk
- jre8-openjdk
- jre8-openjdk-headless
- eclipse-java

## Setup
Download and run the arch linux mainline iso.

Install the dependencies for the `archiso` package:

    (root): pacman -S make squashfs-tools libisoburn dosfstools patch lynx devtools git

Install archiso:

    (user): git clone git://projects.archlinux.org/archiso.git && cd archiso
    (root): make install && cd .. && rm -rf archiso

## Usage
You must run the following command to build the system image, on arch linux.

```bash
sudo ./build.sh -N bu-image -v
```

Default login:
    Username: student
    Password: student

The system is loaded and runs entirely within ram, so it doesn't require any permanent storage mechanism.

## Todo
- [ ] PAM module for authentication
- [ ] WebDav link for home folder
- [ ] Selecting software needed
- [ ] Remove i686?
- [ ] Server/management registration?
- [ ] Custom mirror?
- [ ] PXE
- [ ] Branding (Splash Screen/Naming)
