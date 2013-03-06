require 'chefspec'

describe 'The recipe vsftpd::default' do
  %w( rhel debian ).each do |platform_family|
    describe "for #{platform_family}" do
      let(:chef_run) {
        chef_run = ChefSpec::ChefRunner.new
        chef_run.node.set['platform_family'] = platform_family
        chef_run.node.set['vsftpd'] = { 'allowed' => [ 'vagrant' ], 'chroot' => [ 'vagrant' ] }
        chef_run.converge 'vsftpd::default'
      }

      it 'should install vsftpd' do
        chef_run.should install_package 'vsftpd'
      end

      it 'should create configuration directory /etc/vsftpd' do
        chef_run.should create_directory '/etc/vsftpd'
      end if platform_family == 'debian'

      platform_family == 'debian' ? config = '/etc/vsftpd.conf' : config = '/etc/vsftpd/vsftpd.conf'

      { config => 'local_enable=YES', '/etc/vsftpd/vsftpd.chroot_list' => 'vagrant', '/etc/vsftpd/vsftpd.user_list' => 'vagrant' }.each do |file,content|
        it "should create file #{file} with specific content" do
          chef_run.should create_file file
          chef_run.should create_file_with_content file, content
        end
      end

      it 'should enable and start service vsftpd' do
        chef_run.should start_service 'vsftpd'
        chef_run.should set_service_to_start_on_boot 'vsftpd'
      end
    end
  end
end
