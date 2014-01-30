# Prerequisites:
#   * Networking (wifi-menu or dhcpcd)
#   * Partition Disks (fdisk)
#   * Format partitions (mkfs.*)
#   * Mount partitions to /mnt (mount)

# ArchLinux base setup
pacstrap /mnt base
genfstab -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt

# Setup git, ruby, and chef
pacman -Syy
pacman -S git ruby
gem install chef bundler

# Snag chef scripts and run chef-solo
git clone git@github.com:jesseadams/archlinux-workstation-chef.git
cd archlinux-workstation-chef
bundle install --path vendor/gems
berks install --path vendor/cookbooks
sudo chef-solo -c solo.rb -j node.json
