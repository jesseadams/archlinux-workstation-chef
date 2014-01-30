# WARNING !!! #

This project is currently under heavy development. It will likely change drastically over the coming weeks.

## ArchLinux Workstation and Chef ##

The goal of this project is to be a rough guide/example on how to use Chef to manage your ArchLinux workstation. Many cookbooks have been created in order to faciliate this endeaver.

1. pacman - Provides pacman and AUR LWRPs
2. arch_workstation - facilitates package installation and prep
3. grub - Sets up grub for ArchLinux

## Bootstrapping ArchLinux ##

The rough concept:

1. Create a wrapper cookbook (like this repo)
2. Throw the ArchLinux ISO on a USB stick and boot it up
3. Setup disks and partitions and mount them to /mnt
4. Snag a crafted init.sh script (see one in this repo) with wget and run it

This will pacstrap the system, install ruby + chef+ git, and then run your wrapper cookbook and set your system up.
