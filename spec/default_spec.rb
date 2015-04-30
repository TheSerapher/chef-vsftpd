# encoding: utf-8

require 'spec_helper'

describe 'vsftpd::default' do
  { 'redhat' => '6.5', 'debian' => '7.5' }.each do |platform, platform_version|
    describe "for #{platform}" do
      before(:all) do
        @chef_run = ChefSpec::SoloRunner.new(platform: platform,
                                             version: platform_version)
        @chef_run.node.set['vsftpd'] = { 'allowed' => ['vagrant'], 'chroot' => ['vagrant'] }
        @chef_run.converge(described_recipe)
      end

      # Packages
      it 'should install vsftpd' do
        expect(@chef_run).to install_package('vsftpd')
      end

      # Directories
      %w( /etc/vsftpd /etc/vsftpd/users.d ).each do |d|
        it 'should create directory ' + d do
          expect(@chef_run).to create_directory(d)
        end
      end

      # Configuration files
      it 'should create platform specific vsftpd.conf' do
        file = @chef_run.node['vsftpd']['configfile']
        expect(@chef_run).to render_file(file).with_content('local_enable=YES')
      end
      { '/etc/vsftpd/vsftpd.chroot_list' => 'vagrant',
        '/etc/vsftpd/vsftpd.user_list' => 'vagrant' }.each do |f, c|
        it "should create file #{f} with specific content" do
          expect(@chef_run).to render_file(f).with_content(c)
        end
      end

      # Service
      it 'should enable and start service vsftpd' do
        expect(@chef_run).to start_service('vsftpd')
        expect(@chef_run).to enable_service('vsftpd')
      end
    end
  end
end
