#!/usr/bin/env bash
#
# Prerequisites:
#   * Networking (wifi-menu or dhcpcd)
#   * Partition Disks (fdisk /dev/sdx, etc.)
#   * Format partitions (mkfs.* /dev/sdxx, etc.)
#   * Mount partitions to /mnt (mount)
#   * wget https://raw.github.com/jesseadams/archlinux-workstation-chef/master/init.sh && chmod +x init.sh && ./init.sh
set -e

# ArchLinux base setup
pacstrap /mnt base base-devel
genfstab -p /mnt >> /mnt/etc/fstab

cat > /mnt/init.sh <<EOF
#!/usr/bin/env bash
set -e
pacman -Syy
pacman --noconfirm -S git ruby libxml2 libxslt
version=\`ruby -e "puts RUBY_VERSION"\`
echo "export PATH=\$PATH:/root/.gem/ruby/\$version/bin" >> ~/.bashrc
source ~/.bashrc
echo "Installing gems..."
gem install chef bundler

# Snag chef scripts and run chef-solo
cd ~
git clone https://github.com/jesseadams/archlinux-workstation-chef.git
cd archlinux-workstation-chef
bundle install --path vendor/gems
bundle exec berks install --path vendor/cookbooks
bundle exec chef-solo -c solo.rb -j node.json
EOF

chmod +x /mnt/init.sh
arch-chroot /mnt ./init.sh
