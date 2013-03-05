require 'chefspec'

describe 'The recipe vsftpd::default' do
  let(:chef_run) { ChefSpec::ChefRunner.new.converge 'vsftpd::default' }

  it 'should install vsftpd' do
    chef_run.should install_package 'vsftpd'
  end

  %w( /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.chroot_list /etc/vsftpd/vsftpd.user_list ).each do |file|
    it "should create file #{file}" do
      chef_run.should create_file file
    end
  end
end
