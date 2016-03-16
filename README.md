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
Download the [arch linux mainline iso](https://www.archlinux.org/download/), run it within a virtual machine, 4GB Ram, 50GB drive, 4 CPU cores.

```bash
    wget https://github.com/BU-Computing/system-image/archive/master.tar.gz # Download the latest version of this repository
    tar xf master.tar.gz # Extract it
    cd system-image-master # Enter its directory
    ./setup.sh # Setup the disk
    ./setup.sh # Setup the environment on the disk
```

The system will then power off when you exit, you can remove the iso image from the virtual machine and boot normally, username and password is root.

## Usage
You must run the following command to build the system image, on arch linux:
```bash
    (root): cd /root/system-image # Make sure you are in the build directory
    (root): ./build.sh -N bu-image -v # Build the image
```

The iso is then placed within the out directory, e.g. /root/system-image/out/bu-image-2016.03.16-x86_64.iso

You then extract the iso from the virtual machine to run on physical systems, or another separate virtual machine. You may extract the iso by mounting a usb to the virtual machine and copying it, or mounting a shared folder between the host and guest then copying it.

Default login:
    Username: student
    Password: student

Default root:
    Username: root
    Password: root

The system is loaded and runs entirely within ram, so it doesn't require any permanent storage mechanism.

## Todo
- [ ] Selecting software needed
- [ ] LDAP Auth
- [ ] NFS Mount Home Folders
- [ ] Change custom repo server away from student server
- [ ] Torrent PXE
