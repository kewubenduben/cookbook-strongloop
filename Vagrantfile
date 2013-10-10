# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "cookbook-strongloop-berkshelf"
  config.vm.box = "precise64"

  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :private_network, ip: "33.33.33.10"

  # install by `vagrant plugin install vagrant-cachier`
  config.cache.auto_detect = true unless config.cache.nil?
  # install by `vagrant plugin install vagrant-omnibus`
  config.omnibus.chef_version = :latest unless config.omnibus.nil?
  # install by `vagrant plugin install vagrant-berkshelf`
  config.berkshelf.enabled = true unless config.berkshelf.nil?

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to exclusively install and copy to Vagrant's shelf.
  # config.berkshelf.only = []

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.except = []

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :mysql => {
        :server_root_password => 'rootpass',
        :server_debian_password => 'debpass',
        :server_repl_password => 'replpass'
      }
    }
    chef.log_level = :debug
    chef.run_list = [
        "recipe[strongloop::default]"
    ]
  end
end
