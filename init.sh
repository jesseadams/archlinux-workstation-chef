# Prerequisites:
#   * Networking (wifi-menu or dhcpcd)
#!/usr/bin/env bash
#   * Partition Disks (fdisk)
#   * Format partitions (mkfs.*)
#   * Mount partitions to /mnt (mount)
#   * ./automated_script.sh https://raw.github.com/jesseadams/archlinux-workstation-chef/master/init.sh
set -e

# ArchLinux base setup
pacstrap /mnt base base-devel
genfstab -p /mnt >> /mnt/etc/fstab

echo > /mnt/init.sh <<EOF
#!/usr/bin/env bash
set -e
pacman -Syy
pacman -S git ruby libxml2 libxslt
version=`ruby -e "puts RUBY_VERSION"`
echo "export PATH=\$PATH:/root/.gem/ruby/\$version/bin" >> ~/.bashrc
source ~/.bashrc
gem install chef bundler

# Snag chef scripts and run chef-solo
cd ~
git clone https://github.com/jesseadams/archlinux-workstation-chef.git
cd archlinux-workstation-chef
bundle install --path vendor/gems
bundle exec berks install --path vendor/cookbooks
bundle exec chef-solo -c solo.rb -j node.json
EOF

arch-chroot /mnt ./init.sh
