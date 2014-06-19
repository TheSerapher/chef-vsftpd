# encoding: utf-8

require 'spec_helper'
require 'net/ftp'

describe service('vsftpd') do
  os = backend(Serverspec::Commands::Base).check_os
  if os[:family] == 'RedHat' && os[:release].include?('5.')
    it 'skipped' do
      skip 'chkconfig and service not working via sudo'
    end
  else
    it { should be_enabled }
    it { should be_running }
  end
end

describe file('/etc/vsftpd') do
  it { should be_directory }
end

%w( /etc/vsftpd/vsftpd.chroot_list /etc/vsftpd/vsftpd.user_list ).each do |file_name|
  describe file(file_name) do
    it { should be_file }
  end
end

describe port(21) do
  it { should be_listening.with('tcp') }
end

describe 'FTP localhost' do
  os = backend(Serverspec::Commands::Base).check_os
  if (os[:family] == 'Debian' && os[:release].include?('7.')) ||
     (os[:family] == 'Ubuntu' && os[:release].include?('12.04'))
    it 'skipped' do
      skip 'allow_writeable_chroot=YES not available'
    end
  else
    it 'should allow vagrant/vagrant login' do
      ftp('localhost', 'vagrant', 'vagrant').should be_kind_of(TrueClass)
    end
  end
  it 'should disallow root/root login' do
    ftp('localhost', 'root', 'root').should_not be_kind_of(TrueClass)
  end
end
