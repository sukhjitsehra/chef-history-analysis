# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = 'history-analysis'

  config.omnibus.chef_version = '11.12.8'
  config.berkshelf.enabled = true

  if Vagrant.has_plugin?("vagrant-omnibus")
    config.omnibus.chef_version = 'latest'
  end

  config.vm.box = 'ubuntu-14.04-opscode'
  config.vm.box_url = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box'

  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.provision 'chef_solo' do |chef|
  chef.json = {
    'apt' => {
      'compile_time_update' => true
    },
    'authorization' => {
      'sudo' => {
        'users' => ['vagrant'],
        'passwordless' => true
      }
    }
  }
  chef.run_list = [
    'recipe[sudo]',
    'recipe[ohai]',
  ]
  end
end
