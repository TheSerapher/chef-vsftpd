# vi: set ft=ruby :

require 'berkshelf/vagrant'

Vagrant::Config.run do |config|
  ############################################
  #                                          #
  #    CentOS 6 64 Bit Test                  #
  #                                          #
  ############################################
  config.vm.define :centos do |centos|
    centos.vm.box = "centos-6.3"
    centos.vm.host_name = "vagrant-01.local"
    centos.vm.provision :chef_solo do |chef|
      chef.log_level = :debug
      chef.add_recipe "up2date"
      chef.add_recipe "vsftpd"
      chef.json = { 'platform_family' => 'rhel' }
    end
  end
  ############################################
  #                                          #
  #    Debian Squeeze 64 Test                #
  #                                          #
  ############################################
  config.vm.define :squeeze do |squeeze|
    squeeze.vm.box = "squeeze64"
    squeeze.vm.host_name = "vagrant-01.local"
    squeeze.vm.provision :chef_solo do |chef|
      chef.log_level = :debug
      chef.add_recipe "up2date"
      chef.add_recipe "vsftpd"
      chef.json = { 'platform_family' => 'debian' }
    end
  end
  ############################################
  #                                          #
  #    Debian Wheezy 64 Bit Base Box Test    #
  #                                          #
  ############################################
  config.vm.define :wheezy do |wheezy|
    wheezy.vm.box = "wheezy64"
    wheezy.vm.host_name = "vagrant-01.local"
    wheezy.vm.provision :chef_solo do |chef|
      chef.log_level = :debug
      chef.add_recipe "up2date"
      chef.add_recipe "vsftpd"
      chef.json = { 'platform_family' => 'debian' }
    end
  end
end
