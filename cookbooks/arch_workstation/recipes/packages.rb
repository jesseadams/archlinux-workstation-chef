include_recipe "pacman"

node['archlinux']['packages'].each do |package_name|
  package package_name
end

execute "sudo pacman -S base-devel --noconfirm --needed" do
  action :nothing
end.run_action(:run)

node['archlinux']['packages_aur'].each do |package_name|
  pacman_aur package_name do
    action [ :build, :install ]
  end
end
