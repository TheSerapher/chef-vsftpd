# encoding: utf-8

require 'chefspec'

describe 'vsftpd::default' do
  { 'redhat' => '6.5', 'debian' => '7.5' }.each do |platform_family, platform_version|
    describe "for #{platform_family}" do
      before(:all) do
        @chef_run = ChefSpec::Runner.new('platform' => platform_family,
                                         'version' => platform_version)
        @chef_run.node.set['platform_family'] = platform_family
        @chef_run.node.set['vsftpd'] = { 'allowed' => ['vagrant'], 'chroot' => ['vagrant'] }
        @chef_run.converge(described_recipe)
      end

      it 'should install vsftpd' do
        expect(@chef_run).to install_package('vsftpd')
      end

      it 'should create configuration directory /etc/vsftpd' do
        expect(@chef_run).to create_directory('/etc/vsftpd')
      end if platform_family == 'debian'

      platform_family == 'debian' ? config = '/etc/vsftpd.conf' : config = '/etc/vsftpd/vsftpd.conf'

      { config => 'local_enable=YES',
        '/etc/vsftpd/vsftpd.chroot_list' => 'vagrant',
        '/etc/vsftpd/vsftpd.user_list' => 'vagrant' }.each do |file, content|
        it "should create file #{file} with specific content" do
          expect(@chef_run).to render_file(file)
          expect(@chef_run).to render_file(file).with_content(content)
        end
      end

      it 'should enable and start service vsftpd' do
        expect(@chef_run).to start_service('vsftpd')
        expect(@chef_run).to enable_service('vsftpd')
      end
    end
  end
end
