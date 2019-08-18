#
# Cookbook:: nginx
# Spec:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'nginx::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end

  ####### updating all sources in ubuntu ##########
  it 'runs apt-get update' do
      expect(chef_run).to update_apt_update 'update_sources'
    end

####### install nginx ##########
  it "should install nginx" do
    expect(chef_run).to install_package "nginx"
  end

#### enable nginx service ########
  it 'enables the nginx service' do
      expect(chef_run).to enable_service 'nginx'
  end

  #### start nginx service #######
  it 'start the nginx service' do
      expect(chef_run).to start_service 'nginx'
  end


end
