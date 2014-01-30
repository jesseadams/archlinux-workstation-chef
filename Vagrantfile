hostname = `hostname`.chomp

#Vagrant.require_plugin "vagrant-chef-zero"

Vagrant.configure("2") do |vagrant|
  #vagrant.chef_zero.chef_repo_path = "."
  #vagrant.chef_zero.cookbooks = 'vendor/cookbooks'
  vagrant.berkshelf.enabled = false
  vagrant.vm.box = "archlinux"

  vagrant.vm.provision :chef_client do |chef|
    chef.run_list = [
      "recipe[arch_workstation::packages]"
    ]
  end

  vagrant.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--name', 'arch-workstation']
    vb.customize ['modifyvm', :id, '--memory', '2048']
  end
end
